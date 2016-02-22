class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_order, only: [:show, :send_initial_notification, :send_delivery_notification, :status]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @orders = Order.all
  end

  def show
  end

  # Endpoint for Twilio callback
  def status
    @order.notification_status = params["MessageStatus"]
    @order.save
    render nothing: true
  end

  def send_initial_notification
    @order.status = :shipped
    if @order.save
      message = 'Your clothes will be sent and will be delivered in 20 minutes'
      notify(message)
    else
      redirect_with_error
    end
  end

  def send_delivery_notification
    @order.status = :commited
    if @order.save
      message = 'Your clothes have been delivered'
      notify(message)
    else
      redirect_with_error
    end
  end

  private

  def notify(message)
    MessageSender.send_message(
      @order.id, request.host, @order.phone_number, message)
    redirect_to orders_url, notice: 'Message was delivered'
  end

  def redirect_with_error
    message = "An error has occurred updating the order status"
    redirect_to orders_url, flash: { error: message }
  end

  def load_order
    @order = Order.find(params[:id])
  end

  def record_not_found
    render 'shared/404', status: 404, layout: false
  end
end

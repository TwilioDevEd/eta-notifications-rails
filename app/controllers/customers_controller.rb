class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_customer, only: [:show, :send_initial_notification, :send_delivery_notification]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @customers = Customer.all
  end

  def show
  end

  def send_initial_notification
    message = 'Your clothes will be sent and will be delivered in 20 minutes'
    notify(message)
  end

  def send_delivery_notification
    message = 'Your clothes have been delivered'
    notify(message)
  end

  private

  def notify(message)
    MessageSender.send_message(@customer.phone_number, message)
    redirect_to customers_url, notice: 'Message was delivered'
  end

  def load_customer
    @customer = Customer.find(params[:id])
  end

  def record_not_found
    render 'shared/404', status: 404, layout: false
  end
end

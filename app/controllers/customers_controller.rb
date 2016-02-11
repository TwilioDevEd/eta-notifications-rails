class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def notify
    begin
      # customer (1) -* notifications
      # customers/:id/notifications
      #
      # find customer
      #
      # Build the message notification
      # Body message -> harcoded
      # Phone number <- customer
      # ETA          -> calculated
      #   40 mi/h (origin, destination)
      #   ([2, 4.5], [1, 1])
      #
      # ETA (Faking)
      # calculate(9,9...1,1) -> 8
      # calculate(otw) -> 5
      # calculate(1,1...1,1) -> 0
      #
      # TwilioClient (VCR)
      # Notifier.notify({message: 'Your package ..., it will arrive in about n
      # min, customer_phone_number: 'XXXX'}
      #
      # twilio_phone_number -> ENV['TWILIO_PHONE_NUMBER']
      #
      customer = Customer.find(params[:id])
      render json: customer
    rescue ActiveRecord::RecordNotFound
      render :json => {}.to_json, :status => 404
    end
  end
end

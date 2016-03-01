class MessageSender
  def self.send_message(order_id, host, to, message)
    new.send_message(order_id, host, to, message)
  end

  def initialize
    # To find TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN visit
    # https://www.twilio.com/user/account
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(order_id, host, to, message)
    @client.account.messages.create(
      from:  twilio_number,
      to:    to,
      body:  message,
      status_callback: "http://#{host}/orders/#{order_id}/status"
    )
  end

  private

  def twilio_number
    # A Twilio number you control - choose one from:
    # https://www.twilio.com/user/account/phone-numbers/incoming
    # Specify in E.164 format, e.g. "+16519998877"
    ENV['TWILIO_PHONE_NUMBER']
  end
end

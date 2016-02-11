require 'twilio-ruby'
require 'vcr'
require 'vcr_helper'
require_relative '../../lib/message_sender'

RSpec.describe MessageSender do
  describe '.send_message' do
    it 'sends a message to the customer' do
      VCR.use_cassette('send_sms_to_customer') do
        message = described_class.send_message('+12025550116', 'notification')
        expect(message.status).to eq('queued')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe CustomersController do
  describe '#index' do
    it 'assigns the customers' do
      customer = double('customer')
      allow(Customer).to receive(:all) { [customer] }

      get :index
      expect(assigns :customers).to eq([customer])
    end
  end

  describe '#show' do
    it 'assigns the customer' do
      customer = double('customer')
      allow(Customer).to receive(:find).with('1') { customer }

      get :show, id: '1'
      expect(assigns :customer).to eq(customer)
    end
  end

  describe '#notify_start' do
    it 'a message is sent' do
      customer = double('customer', phone_number: '555 5555')
      allow(Customer).to receive(:find).with('1') { customer }
      expect(MessageSender).to receive(:send_message).
        with(customer.phone_number, 'Your clothes will be sent and will be delivered in 20 minutes')
      
      post :notify_start, id: '1'
    end
  end

  describe '#notify_deliver' do
    it 'a message is sent' do
      customer = double('customer', phone_number: '555 5555')
      allow(Customer).to receive(:find).with('1') { customer }
      expect(MessageSender).to receive(:send_message).
        with(customer.phone_number, 'Your clothes have been delivered')

      post :notify_deliver, id: 1
    end
  end
end

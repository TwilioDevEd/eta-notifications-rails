require 'rails_helper'

RSpec.describe OrdersController do
  describe '#index' do
    it 'assigns the orders' do
      order = double('order')
      allow(Order).to receive(:all) { [order] }

      get :index
      expect(assigns :orders).to eq([order])
    end
  end

  describe '#show' do
    it 'assigns the order' do
      order = double('order')
      allow(Order).to receive(:find).with('1') { order }

      get :show, id: '1'
      expect(assigns :order).to eq(order)
    end
  end

  describe '#send_initial_notification' do
    it 'a message is sent' do
      order = double('order', phone_number: '555 5555')
      allow(Order).to receive(:find).with('1') { order }
      expect(MessageSender).to receive(:send_message).
        with(order.phone_number, 'Your clothes will be sent and will be delivered in 20 minutes')

      post :send_initial_notification, id: '1'
    end
  end

  describe '#send_delivery_notification' do
    it 'a message is sent' do
      order = double('order', phone_number: '555 5555')
      allow(Order).to receive(:find).with('1') { order }
      expect(MessageSender).to receive(:send_message).
        with(order.phone_number, 'Your clothes have been delivered')

      post :send_delivery_notification, id: 1
    end
  end
end

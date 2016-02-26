require 'rails_helper'
require 'rspec/active_model/mocks'

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

  describe 'notifications' do
    let(:order) { mock_model('Order', id: 1, phone_number: '555 5555') }

    before do
      allow(Order).to receive(:find).with('1') { order }
      allow(order).to receive(:status=)
      allow_any_instance_of(Order).to receive(:save) { true }
    end

    describe '#send_initial_notification' do
      it 'a message is sent' do
        expect(MessageSender).to receive(:send_message).
          with(order.id, 'test.host', order.phone_number, 'Your laundry is done and on its way to you!')

        post :send_initial_notification, id: '1'
      end
    end

    describe '#send_delivery_notification' do
      it 'a message is sent' do
        expect(MessageSender).to receive(:send_message).
          with(order.id, 'test.host', order.phone_number, 'Your laundry is arriving now.')

        post :send_delivery_notification, id: 1
      end
    end
  end
end

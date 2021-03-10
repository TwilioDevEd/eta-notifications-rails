require 'rails_helper'
require 'rspec/active_model/mocks'

RSpec.describe OrdersController do
  describe '#index' do
    it 'assigns orders' do
      order = Order.create(customer_name: 'Bob',
                           phone_number: '+1-213-439-8103')

      get :index
      expect(assigns :orders).to eq([order])
    end
  end

  describe '#show' do
    it 'assigns the order' do
      order = Order.create(customer_name: 'Bob',
                           phone_number: '+1-213-439-8103')

      get :show, params: { id: order.id }
      expect(assigns :order).to eq(order)
    end
  end

  # XXX: The following tests are brittle. They need some love (refactor).
  #      I don't have enogh confidence with the current test suite.
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

        post :send_initial_notification, params: { id: '1' }
      end
    end

    describe '#send_delivery_notification' do
      it 'a message is sent' do
        expect(MessageSender).to receive(:send_message).
          with(order.id, 'test.host', order.phone_number, 'Your laundry is arriving now.')

        post :send_delivery_notification, params: { id: 1 }
      end
    end
  end
end

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
      allow(MessageSender).to receive(:send_message)
      post :notify_start, id: '1'
    end
  end

# describe '#notify' do
#   it 'responds with ok' do
#     user = FactoryGirl.create(:customer)
#     post :notify, id: user.id
#     expect(response.status).to eq(200)
#   end
#
#   it 'responds with resource not found when customer doesnt exist' do
#     post :notify, id: 0
#     expect(response.status).to eq(404)
#   end
# end
end

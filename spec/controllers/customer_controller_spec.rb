require 'rails_helper'

RSpec.describe CustomersController do
  describe '#notify' do
    it 'responds with ok' do
      user = FactoryGirl.create(:customer)
      post :notify, id: user.id
      expect(response.status).to eq(200)
    end

    it 'responds with resource not found when customer doesnt exist' do
      post :notify, id: 0
      puts "#{response.status}"
      expect(response.status).to eq(404)
    end
  end
end

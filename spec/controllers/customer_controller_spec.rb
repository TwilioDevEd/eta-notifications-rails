require 'rails_helper'

RSpec.describe CustomersController do
  describe '#notify' do
    it 'responds with ok' do
      post :notify, id: 1
      expect(response.status).to eq(200)
    end
  end
end

require 'rails_helper'

RSpec.describe HomeController do
  describe '#index' do
    it 'responds with ok' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end

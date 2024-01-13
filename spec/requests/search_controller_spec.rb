# spec/controllers/search_controller_spec.rb

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'POST #create' do
    it 'creates a new search term' do
      post :create, params: { term: 'What is a good car' }
      expect(response).to have_http_status(:ok)
    end
  end
end

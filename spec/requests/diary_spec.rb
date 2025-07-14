# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Diary', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/diary/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/diary/year'
      expect(response).to have_http_status(:success)
    end
  end
end

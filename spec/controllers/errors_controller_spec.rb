# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(ErrorsController, type: :controller) do
  describe 'GET #unauthorized' do
    it {
      get :unauthorized
      expect(response).to(have_http_status(:unauthorized))
    }
  end

  describe 'GET #forbidden' do
    it {
      get :forbidden
      expect(response).to(have_http_status(:forbidden))
    }
  end

  describe 'GET #not_found' do
    it {
      get :not_found
      expect(response).to(have_http_status(:not_found))
    }
  end

  describe 'GET #internal_server_error' do
    it {
      get :internal_server_error
      expect(response).to(have_http_status(:internal_server_error))
    }
  end

  describe 'GET #service_unavailable' do
    it {
      get :service_unavailable
      expect(response).to(have_http_status(:service_unavailable))
    }
  end
end

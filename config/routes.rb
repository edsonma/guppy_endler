# frozen_string_literal: true

Rails.application.routes.draw do
  get '401' => 'errors#unauthorized', as: 'error_unauthorized'
  get '403' => 'errors#forbidden', as: 'error_forbidden'
  get '404' => 'errors#not_found', as: 'error_not_found'
  get '500' => 'errors#internal_server_error', as: 'error_internal_server_error'
  get '503' => 'errors#service_unavailable', as: 'error_service_unavailable'

  scope constraints: { format: :json } do
    namespace :api do
      namespace :v1 do
        get '/species' => 'species#index'
        get '/species/:id' => 'species#show'
        post '/auth/login', to: 'authentication#login'
        resources :users
      end
    end
  end

  scope constraints: { format: :html } do
    get '/species' => 'species#index'
  end

  root to: 'species#index'
end

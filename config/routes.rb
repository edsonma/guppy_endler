Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/species' => 'species#index'
    end
  end
  
  get '/species' => 'species#index'
end

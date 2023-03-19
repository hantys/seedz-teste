Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

      post '/sign_up' => 'sessions#create'
      post '/sign_in' => 'sessions#signin'

      root 'sessions#signin'
    end
  end
end

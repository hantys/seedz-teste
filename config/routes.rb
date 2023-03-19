Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
      resources :users

      post '/sign_up' => 'sessions#signup'
      post '/sign_in' => 'sessions#signin'

      root 'sessions#signin'
    end
  end
end

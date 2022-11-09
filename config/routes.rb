Rails.application.routes.draw do
  root to: 'home#index'
  resources :submissions, only: %i[index]

  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :submissions, only: %i[create]
    end
  end
end

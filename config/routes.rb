Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [] do
    resources :meals, only: [:index]
  end
  resources :tables do
    resources :baskets, only: [:create]
  end
  resources :baskets, only: [:show, :update] do
    member do
      get :payment_confirmation
      get :pending_payment
    end
    resources :basket_meals, only: [:create, :edit] do
      collection do
        get 'share', to: 'basket_meals#share'
        post 'share_with', to: 'basket_meals#share_with'
      end
    end
  end
  resources :tables, only: [] do
    member do
      get :qr_code
    end
  end
  resources :basket_meals, only: [:destroy, :update]

  get "map", to:"pages#map"
  get "stylepage", to: "pages#stylepage"
  get 'basic-qr-code-reader', to: 'basicqrcodes#index'
  mount StripeEvent::Engine, at: 'localhost:3000/stripe-webhooks'
end

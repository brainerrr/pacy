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
    end
    resources :basket_meals, only: [:create]
  end
  resources :tables, only: [] do
    member do
      get :qr_code
    end
  end
  resources :basket_meals, only: [:destroy, :update]
  get "stylepage", to: "pages#stylepage"
  get 'basic-qr-code-reader', to: 'basicqrcodes#index'
end

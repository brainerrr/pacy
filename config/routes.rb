Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
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

  get "stylepage", to: "pages#stylepage"
end

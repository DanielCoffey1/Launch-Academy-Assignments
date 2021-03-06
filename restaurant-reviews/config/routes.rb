Rails.application.routes.draw do
  root "restaurants#index"
resources :categories, only: [:new, :create, :index, :show] do
  resources :restaurants, only: [:new, :create, :index, :show] do
    resources :reviews, only: [:new, :create, :index]
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

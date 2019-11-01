Rails.application.routes.draw do
  devise_for :users
  get 'react_hello/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts do
    resources :comments
  end
end

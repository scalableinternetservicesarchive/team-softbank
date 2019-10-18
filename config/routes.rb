Rails.application.routes.draw do
  get 'react_hello/index'
  get 'react_hello/map'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :posts
end

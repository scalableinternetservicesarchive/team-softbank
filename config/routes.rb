Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  get 'profile', controller: :profiles
  get 'react_hello/index'
  post 'posts/update_location'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments do
      post 'toggle_like_comment'
    end
    post 'toggle_like_post'
  end
end

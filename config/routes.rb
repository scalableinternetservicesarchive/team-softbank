Rails.application.routes.draw do
  get 'react_hello/index'
  get 'map/index'
  post 'map/location'
  # post 'geolocation/location', action: :foo, controller: 'map'
  root to: 'map#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

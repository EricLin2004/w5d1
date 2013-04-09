WebStore::Application.routes.draw do
  resources :users
  
  # REV: I think it would be appropriate to have sessions be singular here
  #      as only one session should exist at a time
  resources :sessions
  resources :products
  resource :cart
end

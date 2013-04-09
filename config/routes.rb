WebStore::Application.routes.draw do
  resources :users
  resources :sessions
  resources :products
  resource :cart
end

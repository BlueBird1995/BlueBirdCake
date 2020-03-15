Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :products,only:[:index,:show] do
    resource :carts,only:[:show,:create,:update,:destroy]
  end


end

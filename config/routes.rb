Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users, only: [:show, :edit, :update] do

    resource :carts,only:[:show,:create,:update,:destroy]
    #本当に削除しますかページ

    resources :deliveries
    member do
      get :confirm_destroy
    end
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
    resources :deliveries
  
  resources :products,only:[:index,:show]
  
  
end

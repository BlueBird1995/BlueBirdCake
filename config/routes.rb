Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update]
  end

  root 'homes#top'

  #adminのorder
  get '/admins' => 'admins/orders#top'
  namespace :admins do
    resources :orders, only: [:index, :show, :update]
  end

  resources :users, only: [:show, :edit, :update] do

    resource :carts,only:[:show,:create,:update,:destroy]

    resources :deliveries

    #本当に削除しますかページ

    member do
      get :confirm_destroy
    end
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'


  resources :products,only:[:index,:show]
    namespace :admins do
      resources :products
    end

  get '/orders/success' => 'orders#success'
  post '/orders/success' => 'orders#success'
  resources :orders, only: [:create, :index, :show] do
    collection do
      post :confirm
      get :confirm
    end
  end
  get '/orders/:id/new' => 'orders#new', as:'new_order'
  delete '/users/carts' => 'carts#destroy_all', as:'destroy_all'
end

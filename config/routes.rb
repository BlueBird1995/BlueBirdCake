Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'

  resources :users, only: [:show, :edit, :update] do
    resources :deliveries
    #本当に削除しますかページ
    member do
      get :confirm_destroy
    end
  end
  #ユーザの論理削除するためのroute
  put "/users/:id/hide" => "users#hide", as: 'users_hide'


  get '/orders/success' => 'orders#success'
  post '/orders/success' => 'orders#success'
  resources :orders, only: [:create, :index, :show] do
    collection do
      post :confirm
      get :confirm
    end
  end
  get '/orders/:id/new' => 'orders#new'
  #注文確認画面confirmよくわからん

end

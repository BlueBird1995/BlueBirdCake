Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users, only: [:show, :edit, :update] do
    resources :deliveries
    member do
      get :confirm_destroy
    end
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
end

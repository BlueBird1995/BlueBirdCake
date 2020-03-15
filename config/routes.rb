Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :deliveries
  end
end

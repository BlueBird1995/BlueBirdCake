Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :users, only: [:show, :edit, :update] do
    resources :deliveries
  end
end

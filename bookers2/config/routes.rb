Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#show' , as: 'home'

  resources :books, only: [:new, :create, :edit, :index, :show, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index ]
end

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get '/home/about' => 'homes#show' , as: 'home'

  resources :books, only: [:new, :create, :edit, :index, :show, :update, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show, :edit, :update, :index ] do
    get :followings, on: :member
    get :followers, on: :member
  end
end

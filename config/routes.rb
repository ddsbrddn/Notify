Rails.application.routes.draw do

  get 'notifications/index'

  devise_for :users
  resources :users, only: [:index]

  resources :forum_threads do
    resources :posts
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  root 'forum_threads#index'
end

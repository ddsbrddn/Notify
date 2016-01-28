Rails.application.routes.draw do

  get 'notifications/index'

  devise_for :users
  
  resources :forum_threads do
    resources :posts
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  root 'static_pages#home'
end

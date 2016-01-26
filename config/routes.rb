Rails.application.routes.draw do

  devise_for :users
  resources :forum_threads do
    resources :posts
  end
  root 'static_pages#home'
end

Rails.application.routes.draw do

  resources :forum_threads do
    resources :posts
  end
  root 'static_pages#home'
end

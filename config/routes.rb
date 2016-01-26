Rails.application.routes.draw do

  resources :forum_threads
  root 'static_pages#home'
end

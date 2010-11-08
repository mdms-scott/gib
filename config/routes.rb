Gib::Application.routes.draw do
  devise_for :users

  resources :subforums
  resources :topics
  resources :posts

  root :to => "home#index"

end

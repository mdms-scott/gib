Gib::Application.routes.draw do
  devise_for :users

  resources :subforums
  resources :topics

  root :to => "home#index"

end

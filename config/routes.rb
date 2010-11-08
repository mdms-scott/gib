Gib::Application.routes.draw do
  devise_for :users

  resources :subforums

  root :to => "home#index"

end

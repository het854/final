Rails.application.routes.draw do

  resources :members do
  	collection { post :import }
  end

  resources :sessions
  resources :employment
  resources :bschool
  resources :member_imports
  resources :users

  get "/logout", to: "sessions#destroy"

  root to: 'members#index' 


end

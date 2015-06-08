Rails.application.routes.draw do

  resources :members do
  	collection { post :import }
  end

  resources :sessions
  resources :bschools
  resources :companys
  resources :member_imports
  resources :users

  get "/logout", to: "sessions#destroy"

  root to: 'members#index' 


end

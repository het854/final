Rails.application.routes.draw do

  resources :members do
  	collection { post :import }
  end

  resources :sessions


  get "/logout", to: "sessions#destroy"

  root to: 'members#index' 


end

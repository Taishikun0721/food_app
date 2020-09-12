Rails.application.routes.draw do
  root 'foods#index'
  resources :foods

  namespace :admin do
    resources :users, only: [:index, :new, :create, :destroy]
  end
  resource :profile, only: [:show, :edit, :update]

  resources :comments, only: [:new, :create, :edit, :update, :destroy], shallow: true

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

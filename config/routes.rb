Rails.application.routes.draw do
  root 'foods#index'
  resources :foods do
    resources :comments, only: [:new, :create, :edit, :update, :destroy], shallow: true
  end

  namespace :admin do
    resources :users, only: [:index, :new, :create, :destroy]
  end
  resource :profile, only: [:show, :edit, :update]

  resources :categories, only: [:show]


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end

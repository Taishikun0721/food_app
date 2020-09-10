Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

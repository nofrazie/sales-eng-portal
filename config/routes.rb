Rails.application.routes.draw do

  root    'static_pages#home'
  get     '/help',    to: 'static_pages#help'
  get     '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :integrations
  resources :integration_types
  resources :learning_resources do
    member do
      put "like",     to: "learning_resources#upvote"
      put "dislike",  to: "learning_resources#downvote"
    end
    resources :learning_resource_comments
  end
  resources :learning_resource_types
end

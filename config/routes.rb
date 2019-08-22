Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#index'
  get 'homes/show'
  # get 'users/:id' => 'users#show'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    # get '/trainer/new' => 'users/registrations#trainer' ,as: :new_trainer
    get '/trainer/new' => 'trainers/registrations#new' ,as: :new_trainer
    post '/trainer' => 'trainers/registrations#create' ,as: :create_trainer
    # get '/trainers/:id' => 'trainers#update'
  end

  resources :users
  resources :trainers
end
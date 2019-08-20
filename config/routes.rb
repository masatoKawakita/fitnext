Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#index'
  get 'homes/show'
  # get '/trainer/new' => 'users/registrations#trainer' ,as: :new_trainer
  # get 'users/:id' => 'users#show'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
    get '/trainer/new' => 'users/registrations#trainer' ,as: :new_trainer
  end

  resources :users
  resources :trainers
end
Rails.application.routes.draw do
  root 'homes#index'
  get 'homes/show'
  # get 'users/:id' => 'users#show'

  devise_for :users
  resources :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end

end

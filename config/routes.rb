# Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
#   root 'homes#index'
#   get 'homes/show'
#   # get 'users/:id' => 'users#show'

#   devise_for :users
#   resources :users

#   devise_scope :user do
#     get "sign_in", :to => "users/sessions#new"
#     get "sign_out", :to => "users/sessions#destroy"
#   end
# end

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homes#index'
  get 'homes/show'
  # get 'users/:id' => 'users#show'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  resources :users

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
end
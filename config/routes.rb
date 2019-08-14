Rails.application.routes.draw do
  root 'homes#index'
  get 'homes/show'
end

Rails.application.routes.draw do
  root 'codes#index'
  mount_griddler
  resources :tickets
  resources :codes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

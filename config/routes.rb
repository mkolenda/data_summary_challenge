Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :purchases, only: [:new, :create, :index]

end

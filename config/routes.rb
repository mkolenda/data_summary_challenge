Rails.application.routes.draw do
  root 'welcome#index'

  resources :purchases, only: [:new, :create, :index]

end

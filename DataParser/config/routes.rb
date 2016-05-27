Rails.application.routes.draw do
  

  # You can have the root of your site routed with "root"
  resources :transactions, only: [:index, :create]
  # root 'welcome#index'

 
end

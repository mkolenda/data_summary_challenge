Rails.application.routes.draw do
  root 'purchases#index'

  resources :purchases do
    post "import", on: :collection
  end
end

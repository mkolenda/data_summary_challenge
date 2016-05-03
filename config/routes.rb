Rails.application.routes.draw do
  resources :data_imports do
    collection { post :import }
  end

  root to: "data_imports#index"
end
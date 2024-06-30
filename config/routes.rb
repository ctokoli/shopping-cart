Rails.application.routes.draw do
  root "store#index", as: "store_index"
  # get 'store/index'
  resources :products

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

end

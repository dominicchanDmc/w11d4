Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :pokemon do 
      resources :types ,only: [:index]
      resources :items, only: [:create,:index]
    end
    resources :items ,only: [:update,:destroy]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  get 'museums/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "museums#index"
  resources :museums, only: [:index, :create, :destroy]

end

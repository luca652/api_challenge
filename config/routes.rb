Rails.application.routes.draw do
  get 'requests/new'
  get 'museums/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :museums, only: [ :index ]
    end
  end

end

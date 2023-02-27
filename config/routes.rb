Rails.application.routes.draw do
  root to: "hitmen#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hitmen, only: %i[index show] do
    resources :jobs, only: %i[index show create update destroy]
  end
end

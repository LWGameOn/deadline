Rails.application.routes.draw do
  devise_for :users
  root to: "hitmen#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hitmen, only: %i[index show] do
    resources :jobs, only: %i[index new show create update destroy] do
      resources :messages, only: %i[index new create]
    end
  end
end

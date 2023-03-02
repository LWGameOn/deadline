Rails.application.routes.draw do
  devise_for :users
  root to: "hitmen#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # post '/hitmen/:hitman_id/jobs', to: 'jobs#create', as: 'jobs'

  # get '/jobs/requests', to: 'jobs#index_requests', as: 'requests'

  resources :hitmen, only: %i[index show new create] do
    resources :jobs, only: %i[new create]
  end
  resources :pages, only: %i[home index]
  resources :jobs, only: %i[index show update destroy edit]
end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "user/new" => "user#new"
  post "user/new" => "user#create"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout",  to: "sessions#destroy"
end

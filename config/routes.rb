Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "user/new" => "user#new"
  post "user/new" => "user#create"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout",  to: "sessions#destroy"

  get "comment/:user_id/:post_id/new", to: "comment#new"
  post "comment/new", to: "comment#create"
  get "comment/:id/edit", to: "comment#edit"
  post "comment/:id/update", to: "comment#update"
  delete "comment/:id", to: "comment#destroy"

  resources :posts
end

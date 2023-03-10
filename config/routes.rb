Rails.application.routes.draw do
  resources :users, except: :new
  get  "signup", to: "users#new"

  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#pagesindex"
  get  "about", to: "pages#about"
  get  "login", to: "sessions#new"
  post  "login", to: "sessions#create"
  delete  "logout", to: "sessions#destroy"
end

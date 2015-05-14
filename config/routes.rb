Rails.application.routes.draw do
  devise_for :users

  root "control#index"

  post "/function", to: "control#function"
  post "/variable", to: "control#variable"

  resource :users, only: [:new, :create]
  get   "/user", to: "users#show"
  patch "/user", to: "users#update"
  put   "/user", to: "users#update"
end

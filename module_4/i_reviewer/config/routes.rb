Rails.application.routes.draw do
  resources :books do
    resources :notes
  root to: "books#index"
end

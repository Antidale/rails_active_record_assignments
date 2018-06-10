Rails.application.routes.draw do
  resources :books do
    resources :notes
  end
  root to: "books#index"
end

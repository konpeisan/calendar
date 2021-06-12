Rails.application.routes.draw do
  root to: "budgets#index"
  resources :budgets, only: [:index,:new,:create,:edit,:update,:destroy]
end

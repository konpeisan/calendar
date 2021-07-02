Rails.application.routes.draw do
  root to: "budgets#index"
  resources :budgets do
    collection do
      get 'analysis'
    end
  end
  resources :halls, except: [:new, :show]
  resources :types, except: [:new, :show]
end

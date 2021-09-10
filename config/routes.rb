Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: "devise/registrations#new"
  end
  resources :budgets do
    collection do
      get 'analysis'
    end
  end
  resources :halls, except: [:new, :show]
  resources :types, except: [:new, :show]
  resources :users, only: [:new, :edit, :update]
end

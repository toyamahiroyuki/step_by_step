Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
      }

  root :to => "homes#home"

  get 'homes' => "homes#home"
  get 'homes/top' => "homes#top"
  get 'homes/about' => "homes#about"
  resources :users
  resources :costs, only: [:index]
  resources :incomes, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :targets do
    resources :target_items
  end
  resources :proportial_costs
  resource :fixed_costs, only: [:new, :create, :show, :edit, :update]
  resource :lifelines, only: [:new, :create, :index, :edit, :update]
  resources :loans do
  resources :loan_items
  end
  resource :communication
  resources :goals
  resource :simulations, only: [:new, :index, :update]
  get 'simulations/knowledge' => "simulations#knowledge"
  get 'homes/calendar_total' => "calendar_incomes#total"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

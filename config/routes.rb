Rails.application.routes.draw do
  get 'loan_items/new'
  get 'loan_items/edit'
  get 'target_items/new'
  get 'target_items/edit'
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
  resources :incomes
  resources :targets do
    resources :target_items
  end
  resources :proportial_costs
  resource :fixed_costs, only: [:new, :create, :show, :edit, :update]
  resource :lifelines, only: [:new, :create, :index, :edit, :update]
  resources :loans
  resources :loan_items
  resource :communication
  resource :goal
  resource :simulations, only: [:new, :index, :update]
  get 'simulations/knowledge' => "simulations#knowledge"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

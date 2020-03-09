Rails.application.routes.draw do

  devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'
      }

  # root :to => "homes#about"

  get 'homes/home' => "homes#home"
  get 'homes/top' => "homes#top"
  get 'homes/about' => "homes#about"
  resources :users
  resources :costs, only: [:index]
  resources :incomes
  resources :targets, only: [:new, :create, :index, :edit, :update]
  resources :proportial_costs
  resources :fixed_costs, only: [:new, :create, :index, :edit, :update]
  resources :lifelines, only: [:new, :create, :index, :edit, :update]
  resources :loans
  resources :goals
  resources :simulations, only: [:new, :index, :update]
  get 'simulations/knowledge' => "simulations#knowledge"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

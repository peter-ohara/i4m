Rails.application.routes.draw do
  resources :bank_of_ghana_rates
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :next_of_kins
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

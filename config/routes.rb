Rails.application.routes.draw do
  resources :fixed_deposit_rates
  resources :fixed_deposit_investments
  resources :institutions
  resources :purchased_t_bills
  resources :saved_t_bills
  resources :bank_of_ghana_rates
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :next_of_kins
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :t_bills
  resources :next_of_kins
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

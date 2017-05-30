Rails.application.routes.draw do

  get 'search', to: 'search#index'
  post 'search/save', to: 'search#save'

  get 'fixed_deposit_investments/:id/purchase', to: 'fixed_deposit_investments#new_purchase'
  post 'fixed_deposit_investments/:id/purchase', to: 'fixed_deposit_investments#purchase'


  get 'mutual_funds/:id/purchase', to: 'mutual_funds#new_purchase'
  post 'mutual_funds/:id/purchase', to: 'mutual_funds#purchase'

  resources :mutual_funds
  resources :fixed_deposit_investments
  root to: 'welcome#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

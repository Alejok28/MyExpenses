Rails.application.routes.draw do
  root 'dashboard#index'
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :expenses, except: [:new, :edit]
    end
  end

  get 'dashboard', to: 'dashboard#index'
  get 'category', to: 'dashboard#category'
  resources :expenses
end

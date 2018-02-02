Rails.application.routes.draw do
  root 'dashboard#index'
  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :expenses, except: [:new, :edit]
    end
  end
  namespace :dashboard do
    get 'last_six_months'
  end
  resources :expenses
end

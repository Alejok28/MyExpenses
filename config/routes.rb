Rails.application.routes.draw do
  root 'dashboard#index'
  # namespace :api do
  #   namespace :v1 do
  #     resources :expenses
  #   end
  # end
  namespace :dashboard do
    get 'last_six_months'
  end
  resources :expenses
  # get '/search', to: 'search#index', as: 'search_expense'
end

Rails.application.routes.draw do
  root 'dashboard#index'
  # namespace :api do
  #   namespace :v1 do
  #     resources :expenses
  #   end
  # end
  resources :dashboard, only:[:index]
  resources :expenses
end

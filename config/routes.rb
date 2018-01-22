Rails.application.routes.draw do
  root 'expenses#index'
  # namespace :api do
  #   namespace :v1 do
  #     resources :expenses
  #   end
  # end
  resources :expenses
end

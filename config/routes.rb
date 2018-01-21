Rails.application.routes.draw do
  root 'expenses#index'
  namespace :api do
    namespace :v1 do
      resources :expenses 
    end
  end
  resources :expenses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

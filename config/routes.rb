Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show, :new, :create]

  namespace :api do
   namespace :v1 do
     resources :restaurants, only: [:index, :show]
   end
 end

  devise_for :users
  root 'static_pages#index'
end

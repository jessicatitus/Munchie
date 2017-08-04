Rails.application.routes.draw do

  namespace :api do
   namespace :v1 do
     resources :restaurants, only: [:index]
   end
 end

  devise_for :users
  root 'static_pages#index'
end

Rails.application.routes.draw do

  root to: 'patients#index'

  resources :encounters, only: [:index, :show, :edit, :destroy]
  
  resources :patients, only: [:index, :show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

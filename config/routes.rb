Rails.application.routes.draw do

  root to: 'patients#index'

  resources :patients do
    resources :encounters, except: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

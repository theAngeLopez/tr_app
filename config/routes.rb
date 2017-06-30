Rails.application.routes.draw do
  root to: 'patients#index'

  resources :patients do
    resources :encounters, except: [:index]
  end
end

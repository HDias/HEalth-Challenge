Rails.application.routes.draw do
  resources :municipes, except: %i[show destroy]

  root to: 'municipes#index'
end

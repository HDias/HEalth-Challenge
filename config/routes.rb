Rails.application.routes.draw do
  resources :municipes, except: %i[destroy]
end

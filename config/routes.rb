Rails.application.routes.draw do
  resources :proyects
  root 'proyects#dashboard'
end

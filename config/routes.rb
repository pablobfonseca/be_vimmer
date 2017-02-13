Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :commands
end

Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :commands, only: [:new, :create]
end

Rails.application.routes.draw do
  root to: 'dashboard#index'

  resources :commands do
    collection do
      get :normal_mode
      get :visual_mode
    end
  end
end

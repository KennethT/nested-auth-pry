Rails.application.routes.draw do
  resources :companies do
    resources :locations
    resources :products do
      resources :reviews
    end
  end
  root 'companies#index'
end

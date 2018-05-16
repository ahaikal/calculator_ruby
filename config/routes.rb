Rails.application.routes.draw do
  resources :calculator, only: [:index, :create]
  root to: 'calculator#index'
end

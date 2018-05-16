Rails.application.routes.draw do
  get 'calculator/calculate'
  root to: 'calculator#calculate'
end

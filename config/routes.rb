Rails.application.routes.draw do
  resources :high_scores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'high_scores#index'
end

Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'avaliacao', to: 'avaliacoes#show'
end

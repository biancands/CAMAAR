Rails.application.routes.draw do
  get "templates/show"
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'avaliacao', to: 'avaliacoes#show'
  get 'resultados', to: 'resultados#show'
  get 'templates', to: 'templates#show'
  resources :perguntas, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :formularios, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end

Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'avaliacao', to: 'avaliacoes#show'
  get 'resultados', to: 'resultados#show'
  get "/forms/:id", to: "forms#show"
end

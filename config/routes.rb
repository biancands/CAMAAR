Rails.application.routes.draw do
  get "templates/show"
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'avaliacao', to: 'avaliacoes#show'
  get 'resultados', to: 'resultados#show'
  get 'templates', to: 'templates#show'
  get 'enviar_forms', to: 'enviar_forms#show'
  get 'mudar_senha', to: 'mudar_senha#show'
  get "/forms/:id", to: "forms#show"
end

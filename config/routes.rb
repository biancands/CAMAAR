Rails.application.routes.draw do
  get "templates/show"
  root "sessions#new"
  get "login", to: "sessions#new"
  resources :avaliacoes, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  get "resultados", to: "resultados#show"
  get "templates", to: "templates#show"
  get "enviar_forms", to: "enviar_forms#show"
  get "mudar_senha", to: "mudar_senha#show"
  resources :perguntas, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :formularios, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :respostas, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  post "usuarios/activate", to: "usuarios#activate"
  post "usuarios/login", to: "usuarios#login"
  delete "usuarios/logout", to: "usuarios#logout"
  post "usuarios/change_password", to: "usuarios#change_password"
end

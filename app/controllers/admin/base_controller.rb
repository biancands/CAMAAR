# Controlador base para a área administrativa da aplicação.
#
# Este controlador garante que apenas usuários autenticados e administradores
# possam acessar os controllers que herdam dele.
class Admin::BaseController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin

  layout "admin"

  private

  # Verifica se o usuário atual é um administrador.
  # Se não for, redireciona para a página inicial com uma mensagem de alerta.
  def verificar_admin
    unless current_usuario.admin?
      redirect_to root_path, alert: "Acesso não autorizado"
    end
  end
end

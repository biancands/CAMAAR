# Controlador responsável por ações administrativas.
# Apenas usuários com permissões de administrador podem acessar este controlador.
class AdminController < ApplicationController
  before_action :verificar_admin

  # Importa usuários a partir de um arquivo JSON.
  # O arquivo deve estar localizado em `db/data/class_members.json`.
  #
  # @return [JSON] Mensagem de sucesso ou erro
  def import_usuarios
    file_path = Rails.root.join("db", "data", "class_members.json")

    begin
      ImportUsuariosService.import_from_json(file_path)
      render json: { message: "Importação concluída com sucesso!" }, status: :ok
    rescue => erro
      render json: { error: "Erro ao importar usuários: #{erro.message}" }, status: :unprocessable_entity
    end
  end

  private

  # Verifica se o usuário atual é administrador.
  # Se não for, retorna um erro de acesso não autorizado.
  def verificar_admin
    unless current_usuario&.admin?
      render json: { error: "Acesso não autorizado" }, status: :unauthorized
    end
  end
end

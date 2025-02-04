class AdminController < ApplicationController
  before_action :verificar_admin

  def import_usuarios
    file_path = Rails.root.join("db", "data", "class_members.json")

    begin
      ImportUsuariosService.import_from_json(file_path)
      render json: { message: "Importação concluída com sucesso!" }, status: :ok
    rescue => e
      render json: { error: "Erro ao importar usuários: #{e.message}" }, status: :unprocessable_entity
    end
  end

  private

  def verificar_admin
    unless current_usuario&.admin?
      render json: { error: "Acesso não autorizado" }, status: :unauthorized
    end
  end
end

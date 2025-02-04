class Admin::BaseController < ApplicationController
  before_action :authenticate_usuario!
  before_action :verificar_admin

  layout "admin"

  private

  def verificar_admin
    unless current_usuario.admin?
      redirect_to root_path, alert: "Acesso não autorizado"
    end
  end
end

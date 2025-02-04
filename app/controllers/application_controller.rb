class ApplicationController < ActionController::Base
  helper_method :current_usuario, :admin?

  def current_usuario
    @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
  end

  def admin?
    current_usuario&.admin?
  end
end

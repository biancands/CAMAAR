# Controlador base para todos os controllers da aplicação.
#
# Este controlador contém métodos auxiliares compartilhados, como autenticação
# e verificação de privilégios administrativos.
class ApplicationController < ActionController::Base
  helper_method :current_usuario, :admin?

  # Retorna o usuário atualmente autenticado na sessão.
  #
  # @return [Usuario, nil] O usuário autenticado ou nil se não houver usuário logado.
  def current_usuario
    @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
  end

  # Verifica se o usuário atual é um administrador.
  #
  # @return [Boolean] true se o usuário for admin, false caso contrário.
  def admin?
    current_usuario&.admin?
  end
end

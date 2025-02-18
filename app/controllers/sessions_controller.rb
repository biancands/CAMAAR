# Controlador responsável pelas sessões de usuário.
#
# Métodos:
# - new: Inicializa uma nova sessão de administrador.
# - destroy: Encerra a sessão do usuário e redireciona para a página inicial com uma mensagem de sucesso.
#
# Exemplos:
#
#   SessionsController.new
#   SessionsController.destroy
#
# Arquivo: /home/bianca/Projects/CAMAAR/app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    @is_admin = true
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end

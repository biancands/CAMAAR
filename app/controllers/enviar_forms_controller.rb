# Controlador responsável por gerenciar a exibição de formulários de envio.
#
# Métodos:
# - show: Define a variável de instância @is_admin como verdadeira.
#
# Exemplos:
#   EnviarFormsController.new.show
#
# Arquivo:
# /home/bianca/Projects/CAMAAR/app/controllers/enviar_forms_controller.rb
class EnviarFormsController < ApplicationController
  def show
    @is_admin = true
  end
end

# Controlador responsável por gerenciar a mudança de senha.
#
# Métodos:
# - show: Define a variável de instância @is_admin como true.
#
# Exemplos:
#   Para exibir a página de mudança de senha:
#     GET /mudar_senha
#
# Autor:: Bianca
# Data:: 2023
class MudarSenhaController < ApplicationController
  def show
    @is_admin = true
  end
end

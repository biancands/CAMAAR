# TemplatesController é responsável por gerenciar as ações relacionadas aos templates.
#
# Métodos:
# - show: Define a variável de instância @is_admin como true.
#
# Exemplos:
#   GET /templates/:id
#   Response: Renderiza a visualização do template com a variável @is_admin definida como true.
class TemplatesController < ApplicationController
  def show
    @is_admin = true
  end
end

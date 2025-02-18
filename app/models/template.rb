# Classe Template que herda de ApplicationRecord.
# Representa um modelo de template no sistema.
#
# == Associações
# * belongs_to :usuario - Cada template pertence a um usuário.
#
# == Exemplos
#
#   template = Template.new
#   template.usuario = Usuario.first
#
# == Atributos
# Nenhum atributo adicional além dos herdados de ApplicationRecord.
#
# @author
# Bianca
#
# @since
# 2023
class Template < ApplicationRecord
  belongs_to :usuario
end

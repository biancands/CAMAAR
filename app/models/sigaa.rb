# Classe que representa o modelo Sigaa.
#
# @!attribute [rw] tipo_dado
#   Tipo de dado que deve estar presente.
#
# == Validações
# - Presença de tipo_dado
#
# == Exemplos
#   sigaa = Sigaa.new(tipo_dado: 'exemplo')
#   sigaa.valid? # => true
#
# @see ApplicationRecord
class Sigaa < ApplicationRecord
  validates :tipo_dado, presence: true
end

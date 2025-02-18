# Classe que representa uma Disciplina no sistema.
#
# == Validações
# - +codigo+: deve estar presente e ser único.
# - +nome+: deve estar presente.
#
# == Exemplos
#
#   disciplina = Disciplina.new(codigo: 'MAT101', nome: 'Matemática')
#   disciplina.valid? # => true
#
#   disciplina_invalida = Disciplina.new(codigo: nil, nome: 'Física')
#   disciplina_invalida.valid? # => false
#
# == Atributos
# - +codigo+: String que representa o código da disciplina.
# - +nome+: String que representa o nome da disciplina.
class Disciplina < ApplicationRecord
  validates :codigo, presence: true, uniqueness: true
  validates :nome, presence: true
end

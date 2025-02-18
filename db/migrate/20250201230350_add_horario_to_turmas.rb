# Esta migração adiciona uma nova coluna chamada 'horario' à tabela 'turmas'.
# A coluna 'horario' é do tipo string.
#
# Exemplos:
#
#   add_column :turmas, :horario, :string
#
# @see ActiveRecord::Migration
class AddHorarioToTurmas < ActiveRecord::Migration[7.0]
  def change
    add_column :turmas, :horario, :string
  end
end

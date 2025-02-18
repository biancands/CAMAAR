# db/migrate/XXXXXXXXXXXXXX_add_unique_index_to_turmas_codigo.rb
# Esta migração adiciona um índice único à coluna `codigo` da tabela `turmas`.
#
# Classes:
# - AddUniqueIndexToTurmasCodigo: Define a migração para adicionar o índice único.
#
# Métodos:
# - change: Adiciona o índice único à coluna `codigo` da tabela `turmas`.
#
# Exemplos:
#   Após executar esta migração, a coluna `codigo` na tabela `turmas` terá um índice único,
#   garantindo que não existam valores duplicados nesta coluna.
class AddUniqueIndexToTurmasCodigo < ActiveRecord::Migration[6.0]
  def change
    add_index :turmas, :codigo, unique: true
  end
end

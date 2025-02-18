# Esta migração adiciona um índice único à coluna `codigo` na tabela `disciplinas`.
#
# @example
#   add_index :disciplinas, :codigo, unique: true
#
# @note
#   Índices únicos garantem que os valores na coluna especificada sejam distintos em todas as linhas da tabela.
#
# @see ActiveRecord::Migration
# @see ActiveRecord::ConnectionAdapters::SchemaStatements#add_index
class AddUniqueIndexToDisciplinasCodigo < ActiveRecord::Migration[6.0]
  def change
    add_index :disciplinas, :codigo, unique: true
  end
end

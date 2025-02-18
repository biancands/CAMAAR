# db/migrate/XXXXXXXXXXXXXX_add_unique_index_to_usuarios_matricula.rb
# Esta migração adiciona um índice único à coluna `matricula` na tabela `usuarios`.
#
# Índices únicos garantem que os valores na coluna `matricula` sejam distintos
# em todas as linhas da tabela, prevenindo duplicações.
#
# Exemplos:
#   - Se a tabela `usuarios` possui as seguintes entradas:
#     | id | matricula |
#     |----|-----------|
#     | 1  | 12345     |
#     | 2  | 67890     |
#   - Tentar inserir uma nova entrada com `matricula` igual a `12345` resultará em um erro.
#
# @note Esta migração utiliza a versão 6.0 do ActiveRecord.
class AddUniqueIndexToUsuariosMatricula < ActiveRecord::Migration[6.0]
  def change
    add_index :usuarios, :matricula, unique: true
  end
end

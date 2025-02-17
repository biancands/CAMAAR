# Adiciona a coluna `curso` à tabela `usuarios`.
#
# Esta migração inclui um novo campo para armazenar o curso associado a um usuário.
class AddCursoToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :curso, :string
  end
end

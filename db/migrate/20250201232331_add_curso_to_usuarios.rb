# Adiciona a coluna `curso` à tabela `usuarios`.
#
# Esta migração inclui um novo campo para armazenar o curso associado a um usuário.
# Adiciona a coluna 'curso' à tabela 'usuarios'.
#
# Esta migração adiciona uma nova coluna chamada 'curso' do tipo string
# à tabela 'usuarios'. Esta coluna será usada para armazenar o curso
# associado a cada usuário.
#
# Exemplos:
#
#   Antes da migração:
#     | id | nome  | email           |
#     |----|-------|-----------------|
#     | 1  | João  | joao@email.com  |
#
#   Depois da migração:
#     | id | nome  | email           | curso       |
#     |----|-------|-----------------|-------------|
#     | 1  | João  | joao@email.com  | Engenharia  |
#
# @note Esta migração é gerada automaticamente e deve ser aplicada ao banco de dados
#       usando o comando `rails db:migrate`.
class AddCursoToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :curso, :string
  end
end

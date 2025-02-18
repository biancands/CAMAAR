# Esta migração adiciona duas colunas à tabela `usuarios`:
# - `departamento`: uma coluna do tipo string que armazena o departamento do usuário.
# - `formacao`: uma coluna do tipo string que armazena a formação do usuário.
#
# Exemplos:
#   add_column :usuarios, :departamento, :string
#   add_column :usuarios, :formacao, :string
#
# @note Esta migração utiliza a versão 8.0 do ActiveRecord.
class AddDepartamentoAndFormacaoToUsuarios < ActiveRecord::Migration[8.0]
  def change
    add_column :usuarios, :departamento, :string
    add_column :usuarios, :formacao, :string
  end
end

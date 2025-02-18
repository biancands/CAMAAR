# Esta migração adiciona duas colunas à tabela `usuarios`:
# - `activation_token`: uma string única que será usada para armazenar o token de ativação.
# - `activation_token_sent_at`: um datetime que registra quando o token de ativação foi enviado.
#
# Além disso, um índice único é adicionado à coluna `activation_token` para garantir que não haja tokens duplicados.
#
# Exemplos:
#   add_column :usuarios, :activation_token, :string, unique: true
#   add_column :usuarios, :activation_token_sent_at, :datetime
#   add_index :usuarios, :activation_token, unique: true
class AddActivationTokenToUsuarios < ActiveRecord::Migration[6.0]
  def change
    add_column :usuarios, :activation_token, :string, unique: true
    add_column :usuarios, :activation_token_sent_at, :datetime
    add_index :usuarios, :activation_token, unique: true
  end
end

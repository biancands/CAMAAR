# db/migrate/XXXXXXXXXXXXXX_rename_senha_to_password_digest_in_usuarios.rb
# Esta migração renomeia a coluna 'senha' para 'password_digest' na tabela 'usuarios'.
#
# @example
#   rename_column :usuarios, :senha, :password_digest
#
# @note
#   Esta mudança é necessária para seguir a convenção de nomes do bcrypt, que utiliza 'password_digest' para armazenar senhas criptografadas.
#
# @see ActiveRecord::Migration
class RenameSenhaToPasswordDigestInUsuarios < ActiveRecord::Migration[6.0]
  def change
    rename_column :usuarios, :senha, :password_digest
  end
end

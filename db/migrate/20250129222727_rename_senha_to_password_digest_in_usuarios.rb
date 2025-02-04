# db/migrate/XXXXXXXXXXXXXX_rename_senha_to_password_digest_in_usuarios.rb
class RenameSenhaToPasswordDigestInUsuarios < ActiveRecord::Migration[6.0]
  def change
    rename_column :usuarios, :senha, :password_digest
  end
end
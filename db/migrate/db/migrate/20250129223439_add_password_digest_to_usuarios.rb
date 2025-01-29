# db/migrate/20250129223439_add_password_digest_to_usuarios.rb
class AddPasswordDigestToUsuarios < ActiveRecord::Migration[8.0] # Use sua versão do Rails
  def change
    # Adiciona a coluna apenas se não existir
    add_column :usuarios, :password_digest, :string, if_not_exists: true
  end
end

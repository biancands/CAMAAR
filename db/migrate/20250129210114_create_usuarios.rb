# db/migrate/XXXXXXXXXXXXXX_create_usuarios.rb
class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :tipo, null: false
      t.string :matricula

      t.timestamps
    end

    add_index :usuarios, :email, unique: true
    add_index :usuarios, :matricula, unique: true
  end
end
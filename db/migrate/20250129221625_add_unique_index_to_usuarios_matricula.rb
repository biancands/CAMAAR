# db/migrate/XXXXXXXXXXXXXX_add_unique_index_to_usuarios_matricula.rb
class AddUniqueIndexToUsuariosMatricula < ActiveRecord::Migration[6.0]
  def change
    add_index :usuarios, :matricula, unique: true
  end
end

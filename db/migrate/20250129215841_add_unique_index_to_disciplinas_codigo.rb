class AddUniqueIndexToDisciplinasCodigo < ActiveRecord::Migration[6.0]
  def change
    add_index :disciplinas, :codigo, unique: true
  end
end
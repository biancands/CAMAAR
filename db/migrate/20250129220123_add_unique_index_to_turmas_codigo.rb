# db/migrate/XXXXXXXXXXXXXX_add_unique_index_to_turmas_codigo.rb
class AddUniqueIndexToTurmasCodigo < ActiveRecord::Migration[6.0]
  def change
    add_index :turmas, :codigo, unique: true
  end
end
# db/migrate/XXXXXXXXXXXXXX_create_turmas_usuarios_join_table.rb
class CreateTurmasUsuariosJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :turmas, :usuarios do |t|
      t.index [:turma_id, :usuario_id]
      t.index [:usuario_id, :turma_id]
    end
  end
end
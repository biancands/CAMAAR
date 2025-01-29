# db/migrate/XXXXXXXXXXXXXX_add_disciplina_to_turmas.rb
class AddDisciplinaToTurmas < ActiveRecord::Migration[6.0]
  def change
    add_reference :turmas, :disciplina, foreign_key: true
  end
end
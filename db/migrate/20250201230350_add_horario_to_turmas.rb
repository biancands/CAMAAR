class AddHorarioToTurmas < ActiveRecord::Migration[7.0]
  def change
    add_column :turmas, :horario, :string
  end
end

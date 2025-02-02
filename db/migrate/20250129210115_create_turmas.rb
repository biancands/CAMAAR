class CreateTurmas < ActiveRecord::Migration[7.0]
  def change
    create_table :turmas do |t|
      t.string :codigo
      t.string :nome
      t.string :periodo  # Campo para o semestre (ex: "2021.2")
      t.string :horario  # Campo para o horário (ex: "35M12")
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end

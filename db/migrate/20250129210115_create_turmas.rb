class CreateTurmas < ActiveRecord::Migration[6.0]
  def change
    create_table :turmas do |t|
      t.string :codigo, null: false
      t.string :nome
      t.string :periodo

      t.timestamps
    end

    # Adicionar índice único explicitamente
    add_index :turmas, :codigo, unique: true
  end
end
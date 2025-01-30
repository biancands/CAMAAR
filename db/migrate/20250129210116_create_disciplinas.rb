class CreateDisciplinas < ActiveRecord::Migration[6.0]
  def change
    create_table :disciplinas do |t|
      t.string :codigo, null: false
      t.string :nome, null: false
      t.text :descricao

      t.timestamps
    end

    # Adicionar índice único explicitamente
    add_index :disciplinas, :codigo, unique: true
  end
end
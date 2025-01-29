class CreatePerguntas < ActiveRecord::Migration[6.0]
  def change
    create_table :perguntas do |t|
      t.text :texto, null: false
      t.string :tipo_resposta, null: false
      t.references :formulario, null: false, foreign_key: { to_table: :formularios }

      t.timestamps
    end

    add_index :perguntas, :tipo_resposta
  end
end
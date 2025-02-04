class CreateRespostas < ActiveRecord::Migration[6.0]
  def change
    create_table :respostas do |t|
      t.text :conteudo, null: false
      t.datetime :data_resposta, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      
      # Chaves estrangeiras com constraints rigorosas
      t.references :usuario, null: false, foreign_key: { to_table: :usuarios }
      t.references :pergunta, null: false, foreign_key: { to_table: :perguntas }

      t.timestamps
    end

    # Índices para otimização
    add_index :respostas, :data_resposta
    add_index :respostas, [:usuario_id, :pergunta_id], unique: true
  end
end
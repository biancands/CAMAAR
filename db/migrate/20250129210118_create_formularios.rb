class CreateFormularios < ActiveRecord::Migration[6.0]
  def change
    create_table :formularios do |t|
      t.string :titulo, null: false
      t.text :descricao
      t.datetime :data_criacao, default: -> { 'CURRENT_TIMESTAMP' }
      
      # Chaves estrangeiras explicitamente configuradas
      t.references :usuario, null: false, foreign_key: { to_table: :usuarios }
      t.references :turma, null: false, foreign_key: true

      t.timestamps
    end

    # Índice para otimizar buscas por título (opcional)
    add_index :formularios, :titulo
  end
end
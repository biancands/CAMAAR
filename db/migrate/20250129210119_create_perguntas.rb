# Cria a tabela 'perguntas' com as colunas 'texto', 'tipo_resposta', 'formulario_id' e timestamps.
#
# Colunas:
# - texto: Texto da pergunta (não pode ser nulo).
# - tipo_resposta: Tipo de resposta da pergunta (não pode ser nulo).
# - formulario_id: Referência para a tabela 'formularios' (não pode ser nulo, chave estrangeira).
# - created_at: Timestamp de criação (gerado automaticamente).
# - updated_at: Timestamp de atualização (gerado automaticamente).
#
# Índices:
# - tipo_resposta: Índice na coluna 'tipo_resposta' para otimizar consultas.
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

# Cria a tabela 'formularios' com as colunas especificadas.
#
# Tabela: formularios
# Colunas:
# - titulo (string): Título do formulário, não pode ser nulo.
# - descricao (text): Descrição do formulário.
# - data_criacao (datetime): Data de criação do formulário, com valor padrão de 'CURRENT_TIMESTAMP'.
# - usuario_id (references): Referência para a tabela 'usuarios', não pode ser nulo.
# - turma_id (references): Referência para a tabela 'turmas', não pode ser nulo.
# - created_at (datetime): Timestamp de criação, gerado automaticamente.
# - updated_at (datetime): Timestamp de atualização, gerado automaticamente.
#
# Índices:
# - titulo: Índice para otimizar buscas por título.
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

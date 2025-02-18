# Cria a tabela 'respostas' com colunas e índices apropriados.
#
# Tabela: respostas
# Colunas:
# - conteudo (text, não nulo): Conteúdo da resposta.
# - data_resposta (datetime, não nulo, padrão: CURRENT_TIMESTAMP): Data e hora da resposta.
# - usuario_id (references, não nulo): Referência ao usuário que respondeu.
# - pergunta_id (references, não nulo): Referência à pergunta respondida.
# - created_at (datetime): Data e hora de criação do registro.
# - updated_at (datetime): Data e hora da última atualização do registro.
#
# Índices:
# - data_resposta: Índice para otimização de consultas por data de resposta.
# - [:usuario_id, :pergunta_id] (único): Índice único para garantir que um usuário só possa responder uma vez a uma pergunta específica.
#
# Chaves estrangeiras:
# - usuario_id: Referencia a tabela 'usuarios' com restrição de integridade.
# - pergunta_id: Referencia a tabela 'perguntas' com restrição de integridade.
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
    add_index :respostas, [ :usuario_id, :pergunta_id ], unique: true
  end
end

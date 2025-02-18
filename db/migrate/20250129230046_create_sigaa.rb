# Cria a tabela `sigaas` com colunas para armazenar informações sobre atualizações, tipo de dado e detalhes em formato JSONB.
#
# Tabela: sigaas
# - ultima_atualizacao: datetime, armazena a data e hora da última atualização, com valor padrão sendo o timestamp atual.
# - tipo_dado: string, armazena o tipo de dado.
# - detalhes: jsonb, armazena detalhes adicionais em formato JSONB.
# - created_at: datetime, gerado automaticamente pelo Rails para armazenar a data e hora de criação do registro.
# - updated_at: datetime, gerado automaticamente pelo Rails para armazenar a data e hora da última atualização do registro.
#
# Esta migração utiliza a versão 8.0 do ActiveRecord.
class CreateSigaa < ActiveRecord::Migration[8.0]
  def change
    create_table :sigaas do |t|
      t.datetime :ultima_atualizacao, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :tipo_dado
      t.jsonb :detalhes

      t.timestamps
    end
  end
end

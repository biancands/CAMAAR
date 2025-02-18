# Cria a tabela `sigaas` com as colunas `tipo_dado`, `ultima_atualizacao` e `detalhes`.
#
# Colunas:
# * `tipo_dado` (string): Tipo de dado armazenado.
# * `ultima_atualizacao` (datetime): Data e hora da última atualização.
# * `detalhes` (jsonb): Detalhes adicionais armazenados em formato JSONB.
# * `created_at` (datetime): Data e hora de criação do registro (gerado automaticamente pelo Rails).
# * `updated_at` (datetime): Data e hora da última atualização do registro (gerado automaticamente pelo Rails).
class CreateSigaas < ActiveRecord::Migration[8.0]
  def change
    create_table :sigaas do |t|
      t.string :tipo_dado
      t.datetime :ultima_atualizacao
      t.jsonb :detalhes

      t.timestamps
    end
  end
end

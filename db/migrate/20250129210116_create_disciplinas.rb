# Cria a tabela 'disciplinas' com colunas 'codigo', 'nome' e 'descricao'.
#
# Colunas:
# - codigo: string, não nulo, com índice único.
# - nome: string, não nulo.
# - descricao: texto, opcional.
# - created_at: datetime, gerado automaticamente pelo Rails.
# - updated_at: datetime, gerado automaticamente pelo Rails.
#
# Índices:
# - índice único na coluna 'codigo'.
#
# Esta migração cria a tabela 'disciplinas' e adiciona um índice único na coluna 'codigo' para garantir que não haja duplicatas.
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

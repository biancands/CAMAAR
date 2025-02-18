# Cria a tabela 'turmas' com os seguintes campos:
# - codigo: string
# - nome: string
# - periodo: string (campo para o semestre, ex: "2021.2")
# - horario: string (campo para o horário, ex: "35M12")
# - disciplina: referência para a tabela 'disciplinas', não pode ser nulo, com chave estrangeira
# - timestamps: campos automáticos 'created_at' e 'updated_at'
#
# Esta migração cria a tabela 'turmas' e define suas colunas e relacionamentos.
class CreateTurmas < ActiveRecord::Migration[7.0]
  def change
    create_table :turmas do |t|
      t.string :codigo
      t.string :nome
      t.string :periodo  # Campo para o semestre (ex: "2021.2")
      t.string :horario  # Campo para o horário (ex: "35M12")
      t.references :disciplina, null: false, foreign_key: true

      t.timestamps
    end
  end
end

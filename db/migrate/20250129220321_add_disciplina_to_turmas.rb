# db/migrate/XXXXXXXXXXXXXX_add_disciplina_to_turmas.rb
# Esta migração adiciona uma referência à tabela `turmas` para a tabela `disciplina`.
# A coluna adicionada será uma chave estrangeira, garantindo a integridade referencial
# entre as tabelas `turmas` e `disciplina`.
#
# Métodos:
# - change: Adiciona a coluna de referência `disciplina_id` à tabela `turmas`.
#
# Exemplos:
#   Após a execução desta migração, a tabela `turmas` terá uma coluna `disciplina_id`
#   que referencia a tabela `disciplina`.
class AddDisciplinaToTurmas < ActiveRecord::Migration[6.0]
  def change
    add_reference :turmas, :disciplina, foreign_key: true
  end
end

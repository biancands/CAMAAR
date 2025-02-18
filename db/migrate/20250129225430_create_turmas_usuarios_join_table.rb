# db/migrate/XXXXXXXXXXXXXX_create_turmas_usuarios_join_table.rb
# Cria a tabela de junção entre turmas e usuários.
#
# Esta migração cria uma tabela de junção chamada `turmas_usuarios` para estabelecer
# um relacionamento muitos-para-muitos entre as tabelas `turmas` e `usuarios`.
#
# Índices compostos são adicionados para melhorar a performance das consultas que
# envolvem as colunas `turma_id` e `usuario_id`.
#
# Exemplos:
#
#   create_join_table :turmas, :usuarios do |t|
#     t.index [:turma_id, :usuario_id]
#     t.index [:usuario_id, :turma_id]
#   end
#
# @see ActiveRecord::Migration
# @see ActiveRecord::ConnectionAdapters::SchemaStatements#create_join_table
class CreateTurmasUsuariosJoinTable < ActiveRecord::Migration[8.0]
  def change
    create_join_table :turmas, :usuarios do |t|
      t.index [ :turma_id, :usuario_id ]
      t.index [ :usuario_id, :turma_id ]
    end
  end
end

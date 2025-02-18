# app/models/turma.rb
# == Descrição
#
# A classe Turma representa uma turma de uma disciplina específica.
#
# == Associações
#
# * belongs_to :disciplina - Cada turma pertence a uma disciplina.
# * has_and_belongs_to_many :usuarios, join_table: :turmas_usuarios - Cada turma pode ter muitos usuários (alunos) e cada usuário pode estar em muitas turmas.
#
# == Validações
#
# * Valida a presença e unicidade de :codigo, :periodo e :horario no escopo de :disciplina_id.
# * Valida a presença de :disciplina.
#
# == Atributos
#
# * codigo - Código identificador da turma.
# * periodo - Período em que a turma é oferecida.
# * horario - Horário das aulas da turma.
class Turma < ApplicationRecord
  belongs_to :disciplina
  has_and_belongs_to_many :usuarios, join_table: :turmas_usuarios

  validates :codigo, :periodo, :horario, presence: true, uniqueness: { scope: :disciplina_id }
  validates :disciplina, presence: true
end

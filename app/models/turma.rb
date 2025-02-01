# app/models/turma.rb
class Turma < ApplicationRecord
  belongs_to :disciplina
  has_and_belongs_to_many :usuarios, join_table: :turmas_usuarios

  validates :codigo, presence: true, uniqueness: { scope: :disciplina_id }
  validates :disciplina, presence: true
end

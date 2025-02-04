class Disciplina < ApplicationRecord
  validates :codigo, presence: true, uniqueness: true
  validates :nome, presence: true
end

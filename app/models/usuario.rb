# app/models/usuario.rb
class Usuario < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :turmas, join_table: :turmas_usuarios

  validates :email, :tipo, presence: true
  validates :matricula, uniqueness: true, allow_nil: true

  # Validações condicionais
  validates :curso, presence: true, if: :discente?
  validates :departamento, :formacao, presence: true, if: :docente?

  def discente?
    tipo == "Discente"
  end

  def docente?
    tipo == "Docente"
  end
end

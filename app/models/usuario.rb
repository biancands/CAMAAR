# Classe Usuario representa um usuário no sistema.
#
# Atributos:
# - email: string, obrigatório
# - tipo: string, obrigatório (pode ser "Discente", "Docente" ou "Admin")
# - matricula: string, único, pode ser nulo
# - curso: string, obrigatório se o tipo for "Discente"
# - departamento: string, obrigatório se o tipo for "Docente"
# - formacao: string, obrigatório se o tipo for "Docente"
#
# Associações:
# - has_and_belongs_to_many :turmas, join_table: :turmas_usuarios
#
# Métodos:
# - discente?: retorna true se o tipo for "Discente"
# - docente?: retorna true se o tipo for "Docente"
# - admin?: retorna true se o tipo for "Admin"
# - toggle_admin!: promove ou destitui um usuário como administrador
#
# Validações:
# - email e tipo são obrigatórios
# - matricula deve ser única, mas pode ser nula
# - curso é obrigatório se o tipo for "Discente"
# - departamento e formacao são obrigatórios se o tipo for "Docente"
class Usuario < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :turmas, join_table: :turmas_usuarios

  # Validações
  validates :email, :tipo, presence: true
  validates :matricula, uniqueness: true, allow_nil: true

  # Validações condicionais
  validates :curso, presence: true, if: :discente?
  validates :departamento, :formacao, presence: true, if: :docente?

  # Métodos auxiliares para tipos
  def discente?
    tipo == "Discente"
  end

  def docente?
    tipo == "Docente"
  end

  def admin?
    tipo == "Admin"
  end

  # Método para promover/destituir administradores
  def toggle_admin!
    update(tipo: admin? ? "Discente" : "Admin")
  end
end

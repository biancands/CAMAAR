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

# app/models/usuario.rb
class Usuario < ApplicationRecord
  has_secure_password # Mantenha esta linha
  has_and_belongs_to_many :turmas

  validates :email, presence: true, uniqueness: true
  validates :matricula, uniqueness: true, allow_nil: true
end

# app/models/turma.rb
class Turma < ApplicationRecord
  belongs_to :disciplina
  has_and_belongs_to_many :usuarios
end

# app/models/disciplina.rb
class Disciplina < ApplicationRecord
  has_many :turmas, dependent: :destroy
end
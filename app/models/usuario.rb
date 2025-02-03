# app/models/usuario.rb
class Usuario < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nome, presence: true
  validates :tipo, presence: true, inclusion: { in: %w[docente dicente] }
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

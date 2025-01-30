# app/models/turma.rb
class Turma < ApplicationRecord
  belongs_to :disciplina
  has_and_belongs_to_many :usuarios, join_table: :turmas_usuarios # Adicione isso
end

# app/models/usuario.rb
class Usuario < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :turmas, join_table: :turmas_usuarios # Adicione isso
  # ... validações
end
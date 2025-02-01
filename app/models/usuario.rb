# app/models/usuario.rb
class Usuario < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :turmas, join_table: :turmas_usuarios

  validates :email, presence: true, uniqueness: true
  validates :matricula, uniqueness: true, allow_nil: true
end

class Formulario < ApplicationRecord
    validates :titulo, :descricao, :usuario_id, :turma_id, presence: true
    belongs_to :turma
    belongs_to :usuario
    belongs_to :template
    
    has_many :perguntas
    has_many :respostas, through: :pergunta
end

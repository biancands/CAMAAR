class Template < ApplicationRecord
    belongs_to :usuario
    
    has_many :formularios
    has_many :perguntas, through :formulario
    has_many :respostas, through: :pergunta
end

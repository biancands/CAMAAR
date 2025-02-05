class Pergunta < ApplicationRecord
    belongs_to :formulario
    has_many :respostas
end

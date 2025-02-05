class Resposta < ApplicationRecord
    belongs_to :pergunta
    belongs_to :usuario
end

class Resposta < ApplicationRecord
    belongs_to :pergunta
    belongs_to :usuario

    validates :conteudo, :usuario_id, :pergunta_id, presence: true
end

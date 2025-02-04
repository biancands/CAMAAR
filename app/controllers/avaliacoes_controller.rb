class AvaliacoesController < ApplicationController
  def index
    @is_admin = true

    @turmas = Turma.includes(:disciplina, :usuarios).all
    @professores = Usuario.where(tipo: "Docente").index_by(&:id)
    
    @avaliacoes = @turmas.map do |turma|
      professor_id = turma.usuarios.first&.id
      {
        id: turma.id,
        materia: turma.disciplina.nome,
        semestre: turma.periodo,
        professor: @professores[professor_id]&.nome
      }
    end
  end
end


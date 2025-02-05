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
 
  
  def show

    return redirect_to root_path, alert: "Formulário não encontrado." if formulario.empty? || (formulario.filter{|obj| obj.id == (params[:id]).to_i}).empty?
    @form = Formulario.includes(:usuario, turma: :disciplina, perguntas: :respostas).find(params[:id])

  end

  def new
    @form = Formulario.new
  end

  def create
    @form = formulario.new(formulario_params)
  end

  private

  def formulario_params
    params.require(:formulario).permit(:titulo, :descricao, :usuario_id, :turma_id, :created_at, :created_at, :updated_at )
  end
end


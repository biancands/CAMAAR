# 99 issue responder formulario.
class FormulariosController < ApplicationController
  def formulariosTurma
    @turma = Turma.find(params[:id])
  
    @forms = Formulario
      .select("id, titulo, descricao, TO_CHAR(data_criacao, 'DD/MM/YYYY') AS data_formatada")
      .where(turma_id: @turma.id)
  end

  def show
    @is_admin = true

    formulario = Formulario.all

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
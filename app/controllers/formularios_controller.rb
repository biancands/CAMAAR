class FormulariosController < ApplicationController
  
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
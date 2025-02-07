# 99 issue responder formulario.
class FormulariosController < ApplicationController
  def formulariosTurma
    @turma = Turma.find(params[:id])
  
    @forms = Formulario
      .select("id, titulo, descricao, TO_CHAR(data_criacao, 'DD/MM/YYYY') AS data_formatada")
      .where(turma_id: @turma.id)
  end

  def new
    @is_admin = true
    @form = Formulario.new
  end

  def create
    @is_admin = true
    @form = formulario.new(formulario_params)
  end

  private

  def formulario_params
    params.require(:formulario).permit(:titulo, :descricao, :usuario_id, :turma_id, :created_at, :created_at, :updated_at )
  end
end
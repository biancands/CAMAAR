class FormulariosController < ApplicationController
  def show

    @form = Formulario.includes(:usuario, turma: :disciplina, perguntas: :respostas).find(params[:id])

   ## é para ir para o home quando o index, não estiver na tabela de formularop. return redirect_to root_path, alert: "Formulário não encontrado." if rescue ActiveRecord::RecordNotFound
    puts @form

  end

  def new
    @form = formulario.new
  end

  def create
    @form = formulario.new(formulario_params)
  end

  private

  def formulario_params
    params.require(:formulario).permit(:titulo, :descricao, :usuario_id, :turma_id, :created_at, :created_at, :updated_at )
  end
end
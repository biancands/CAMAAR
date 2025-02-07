class RespostasController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    before_action :set_formulario, only: [:new]
  
    def new
      @resposta = Resposta.new
    end
  
    def create
        formulario_id = params[:formulario_id]
      
        if formulario_id.blank?
          Rails.logger.error "Erro: Nenhum formulario_id recebido no create!"
          return head :unprocessable_entity
        end
      
        respostas = []
        params[:resposta].each do |_, resposta_params|
          resposta_params[:conteudo] = resposta_params[:conteudo].is_a?(Array) ? resposta_params[:conteudo].join(", ") : resposta_params[:conteudo]
          resposta = Resposta.new(resposta_params.permit(:conteudo, :pergunta_id, :usuario_id))
          respostas << resposta if resposta.save
        end
      
        if respostas.any?
          redirect_to "/avaliacoes", notice: "Respostas enviadas com sucesso!"
        else
          flash[:error] = "Erro ao salvar as respostas."
          render :new, status: :unprocessable_entity
        end
    end
  
    private
  
    def set_formulario
        formulario_id = params[:formulario_id] || params[:id]
      
        if formulario_id.blank?
          Rails.logger.error "Erro: Nenhum formulario_id recebido!"
          return head :not_found
        end
      
        @form = Formulario.includes(:usuario, :perguntas, turma: :disciplina).find_by(id: formulario_id)
      
        if @form.nil?
          Rails.logger.error "Erro: Formulario não encontrado com ID #{formulario_id}"
          return head :not_found
        end
      end
  end
  
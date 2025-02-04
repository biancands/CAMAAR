class RespostasController < ApplicationController
    def new
        @resposta = Resposta.new
        @form = Formulario.all
    end
  end
  
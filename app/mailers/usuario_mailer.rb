# issue: 105 - Enviar e-mail de ativação
class UsuarioMailer < ApplicationMailer
  default from: "no-reply@camaar.com"

  def activation_email
    @usuario = params[:usuario]
    @token = params[:token]

    mail(to: @usuario.email, subject: "Seu Token de Ativação - CAMAAR")
  end
end

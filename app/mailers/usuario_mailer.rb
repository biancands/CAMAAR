# issue: 105 - Enviar e-mail de ativação
# Classe responsável pelo envio de e-mails relacionados ao usuário.
# Herda de ApplicationMailer.
#
# @example Envio de e-mail de ativação
#   UsuarioMailer.with(usuario: @usuario, token: @token).activation_email.deliver_now
#
# @!method activation_email
#   Método responsável por configurar o e-mail de ativação do usuário.
#   Utiliza os parâmetros :usuario e :token para personalizar o e-mail.
#   Define o remetente padrão como "no-reply@camaar.com".
#   Envia o e-mail para o endereço do usuário com o assunto "Seu Token de Ativação - CAMAAR".
#
#   @param [Hash] params Parâmetros para configuração do e-mail.
#   @option params [Usuario] :usuario O usuário que receberá o e-mail.
#   @option params [String] :token O token de ativação do usuário.
class UsuarioMailer < ApplicationMailer
  default from: "no-reply@camaar.com"

  def activation_email
    @usuario = params[:usuario]
    @token = params[:token]

    mail(to: @usuario.email, subject: "Seu Token de Ativação - CAMAAR")
  end
end

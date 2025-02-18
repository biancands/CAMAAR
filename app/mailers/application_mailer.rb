# Classe base para todos os mailers da aplicação.
#
# @example Definindo um mailer
#   class UserMailer < ApplicationMailer
#     def welcome_email(user)
#       @user = user
#       mail(to: @user.email, subject: 'Bem-vindo ao nosso site')
#     end
#   end
#
# @note Esta classe define um remetente padrão e um layout para os emails.
#
# @see ActionMailer::Base
#
# @since 1.0.0
class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end

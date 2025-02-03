# issue: 105 - Enviar e-mail de ativação senha
class UsuariosController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def activate
    usuario = Usuario.find_by(email: params[:email], activation_token: params[:token])

    if usuario && usuario.activation_token_sent_at > 24.hours.ago
      if params[:password] == params[:password_confirmation]
        usuario.update(
          password: params[:password],
          activation_token: nil,
          activation_token_sent_at: nil
        )
        render json: { message: "Senha definida com sucesso! Agora você pode fazer login." }, status: :ok
      else
        render json: { error: "As senhas não coincidem." }, status: :unprocessable_entity
      end
    else
      render json: { error: "Token inválido ou expirado." }, status: :unprocessable_entity
    end
  end

  # Nova ação de login
  def login
    usuario = Usuario.find_by(email: params[:email]) || Usuario.find_by(matricula: params[:email])

    if usuario&.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      render json: { message: "Login bem-sucedido!", redirect_to: "/avaliacao" }, status: :ok
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  def logout
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end

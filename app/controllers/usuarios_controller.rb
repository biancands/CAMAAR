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

  # issue 104 - Login
  def login
    usuario = Usuario.find_by(email: params[:email]) || Usuario.find_by(matricula: params[:email])

    if usuario&.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      render json: { message: "Login bem-sucedido!", redirect_to: "/avaliacoes" }, status: :ok
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  def logout
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end

  # issue 107 - Mudar senha
  def change_password
    usuario = Usuario.find(session[:usuario_id])

    if usuario.authenticate(params[:current_password]) # Confirma se a senha atual está correta
      if params[:new_password] == params[:password_confirmation]
        usuario.update(password: params[:new_password])
        render json: { message: "Senha alterada com sucesso!" }, status: :ok
      else
        render json: { error: "As senhas novas não coincidem." }, status: :unprocessable_entity
      end
    else
      render json: { error: "Senha atual incorreta." }, status: :unauthorized
    end
  end

  private

  def authenticate_usuario!
    unless session[:usuario_id]
      render json: { error: "Usuário não autenticado." }, status: :unauthorized
    end
  end
end

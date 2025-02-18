# Controlador responsável pelo gerenciamento de usuários, incluindo ativação, login e alteração de senha.
class UsuariosController < ApplicationController
  before_action :authenticate_usuario!, only: [:change_password, :logout]

  # Ativa a conta do usuário definindo uma senha
  #
  # @return [JSON] Mensagem de sucesso ou erro
  def activate
    usuario = Usuario.find_by(email: params[:email], activation_token: params[:token])

    return render json: { error: "Token inválido ou expirado." }, status: :unprocessable_entity unless token_valido?(usuario)

    return render json: { error: "As senhas não coincidem." }, status: :unprocessable_entity unless senhas_coincidem?

    usuario.update!(password: senha_nova, activation_token: nil, activation_token_sent_at: nil)
    render json: { message: "Senha definida com sucesso! Agora você pode fazer login." }, status: :ok
  end

  # Realiza login do usuário
  #
  # @return [JSON] Mensagem de sucesso ou erro
  def login
    usuario = buscar_usuario(email_usuario)

    if usuario&.authenticate(senha_usuario)
      session[:usuario_id] = usuario.id
      render json: { message: "Login bem-sucedido!", redirect_to: "/avaliacao" }, status: :ok
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  # Realiza logout do usuário
  def logout
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end

  # Altera a senha do usuário autenticado
  #
  # @return [JSON] Mensagem de sucesso ou erro
  def change_password
    usuario = Usuario.find(session[:usuario_id])

    return render json: { error: "Senha atual incorreta." }, status: :unauthorized unless usuario.authenticate(senha_atual)

    return render json: { error: "As senhas novas não coincidem." }, status: :unprocessable_entity unless senhas_coincidem?

    usuario.update!(password: senha_nova)
    render json: { message: "Senha alterada com sucesso!" }, status: :ok
  end

  private

  # Verifica se o usuário está autenticado
  def authenticate_usuario!
    return if session[:usuario_id]

    render json: { error: "Usuário não autenticado." }, status: :unauthorized
  end

  # Busca usuário pelo e-mail ou matrícula
  #
  # @param email [String] E-mail ou matrícula do usuário
  # @return [Usuario, nil] Usuário encontrado ou nil
  def buscar_usuario(email)
    Usuario.find_by(email: email) || Usuario.find_by(matricula: email)
  end

  # Verifica se o token de ativação ainda é válido
  #
  # @param usuario [Usuario, nil] Usuário a ser validado
  # @return [Boolean] true se for válido, false caso contrário
  def token_valido?(usuario)
    usuario.present? && usuario.activation_token_sent_at > 24.hours.ago
  end

  # Verifica se as senhas digitadas coincidem
  #
  # @return [Boolean] true se as senhas coincidirem, false caso contrário
  def senhas_coincidem?
    senha_nova == senha_confirmacao
  end

  # Retorna a senha digitada pelo usuário
  #
  # @return [String] Senha nova
  def senha_nova
    params[:password] || params[:new_password]
  end

  # Retorna a senha de confirmação digitada pelo usuário
  #
  # @return [String] Senha de confirmação
  def senha_confirmacao
    params[:password_confirmation]
  end

  # Retorna a senha atual digitada pelo usuário
  #
  # @return [String] Senha atual
  def senha_atual
    params[:current_password]
  end

  # Retorna o e-mail ou matrícula do usuário
  #
  # @return [String] E-mail ou matrícula
  def email_usuario
    params[:email]
  end

  # Retorna a senha do usuário
  #
  # @return [String] Senha do usuário
  def senha_usuario
    params[:password]
  end
end

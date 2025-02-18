# Controlador responsável pelo gerenciamento de usuários na área administrativa.
#
# Permite aos administradores listar, criar, editar e excluir usuários.
class Admin::UsuariosController < Admin::BaseController
  before_action :set_usuario, only: %i[show edit update destroy]

  # Lista todos os usuários, separando-os por tipo
  #
  # @return [Array<Usuario>] Listas de discentes e docentes
  def index
    @discentes = Usuario.discentes.order(:nome)
    @docentes = Usuario.docentes.order(:nome)
  end

  # Exibe o formulário para criar um novo usuário
  #
  # @return [Usuario] Novo objeto de usuário
  def new
    @usuario = Usuario.new
  end

  # Cria um novo usuário com os parâmetros fornecidos
  #
  # @return [Redirect] Redireciona para a lista de usuários se bem-sucedido
  def create
    @usuario = Usuario.new(usuario_params)

    if @usuario.save
      redirect_to admin_usuarios_path, notice: "Usuário criado com sucesso"
    else
      render :new
    end
  end

  # Exibe o formulário para editar um usuário existente
  #
  # @return [Usuario] Objeto de usuário carregado
  def edit
    verificar_usuario
  end

  # Atualiza os dados de um usuário existente
  #
  # @return [Redirect] Redireciona para a lista de usuários se bem-sucedido
  def update
    verificar_usuario

    if @usuario.update(usuario_params)
      redirect_to admin_usuarios_path, notice: "Usuário atualizado"
    else
      render :edit
    end
  end

  # Exclui um usuário existente
  #
  # @return [Redirect] Redireciona para a lista de usuários
  def destroy
    verificar_usuario
    @usuario.destroy
    redirect_to admin_usuarios_path, notice: "Usuário removido"
  end

  private

  # Define a variável @usuario com base no ID fornecido
  #
  # @return [Usuario, nil] Usuário encontrado ou erro 404
  def set_usuario
    @usuario = Usuario.find_by(id: params[:id])
  end

  # Verifica se @usuario existe antes de executar ações críticas
  #
  # @return [Redirect] Se o usuário não for encontrado, redireciona para a lista de usuários
  def verificar_usuario
    return if @usuario.present?

    redirect_to admin_usuarios_path, alert: "Usuário não encontrado"
  end

  # Define os parâmetros permitidos para usuários
  #
  # @return [Hash] Parâmetros filtrados
  def usuario_params
    params.require(:usuario).permit(
      :nome,
      :email,
      :password,
      :password_confirmation,
      :ocupacao
    )
  end
end

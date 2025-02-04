class Admin::UsuariosController < Admin::BaseController
  before_action :set_usuario, only: [ :show, :edit, :update, :destroy ]

  def index
    @discentes = Usuario.discentes.order(:nome)
    @docentes = Usuario.docentes.order(:nome)
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to admin_usuarios_path, notice: "Usuário criado com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to admin_usuarios_path, notice: "Usuário atualizado"
    else
      render :edit
    end
  end

  def destroy
    @usuario.destroy
    redirect_to admin_usuarios_path, notice: "Usuário removido"
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

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

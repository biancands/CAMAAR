class SessionsController < ApplicationController
  def new
    @is_admin = true
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path, notice: "Logout realizado com sucesso!"
  end
end

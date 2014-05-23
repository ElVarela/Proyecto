class SessionsController < ApplicationController
  def new
  	@title = "Login"
  end
 
  def create
   usuario = Usuario.valida_login(params[:session][:emal],params[:session][:password])
   if usuario
      session[:current_user_id] = usuario.id
      redirect_to root_url flash[:notice] = "Bienvenido: #{usuario.nombre}"
    else
      flash[:notice] = "Correo o password invalido!!"
      redirect_to '/blog/login'


    end
  end
 
  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url flash[:notice] = "Nos vemos pronto"
  end
end
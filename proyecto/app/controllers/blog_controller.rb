
class BlogController < ApplicationController
	
before_filter :valida_autentificacion, :except => [:login, :index, :registro, :registrar_usuario]
  #<--protege los metodos criticos------------------->
  skip_before_filter :valida_autentificacion!, :except => [:foto_nueva, :guardar_foto]

	def index
		@fotos = Foto.all
	end

	def foto_nueva
		@foto = Foto.new
	end

	def registro
		@usuario =Usuario.new
	end

	def guardar_foto
		@foto = Foto.new(foto_params)
		@foto.usuario_id = @usuario.id
		if @foto.save
			flash[:notice] = "Tu foto se subio con exito !!"
		   redirect_to :action => 'index'
		else
			flash[:notice] = "Hubo un problema al cargar la foto, revisa todos los campos"
			render :action => 'foto_nueva'
		end
	end

	def foto_params
		params.require(:foto).permit(:titulo,:descripcion,:image)
	end

	def registrar_usuario

		@usuario = Usuario.new(usuario_params)
		if @usuario.save
			session[:current_user_id] = @usuario.id
            flash[:notice] = "Bienvenido: #{@usuario.nombre}"
			redirect_to :action => 'index'
		else
			flash[:notice] = "Los campos son obligatorios; Correo ya existe"
			render :action => 'registro'
		end

	end

def show
end


	def encrypta
		params.require(:usuario).permit(:password)
	end

		def usuario_params
		   params.require(:usuario).permit(:nombre,:emal,:password)
	    end


	    def valida_autentificacion
           if !session[:current_user_id]
         redirect_to :action => "login"
              else
     	        @usuario=Usuario.find(session[:current_user_id])

           end
       end


	   
end


class BlogController < ApplicationController
	def index
		@fotos = Foto.all
	end

	def foto_nueva
		@foto = Foto.new
	end

	def guardar_foto
		@foto = Foto.new(foto_params)
		if @foto.save
		   redirect_to :action => 'index'
		else
			render :action => 'foto_nueva'
		end
	end

	def foto_params
		params.require(:foto).permit(:titulo,:descripcion,:image)
	end

end

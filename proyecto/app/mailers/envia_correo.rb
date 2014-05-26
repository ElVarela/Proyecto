class EnviaCorreo < ActionMailer::Base
  default from: "adriancomerciovarela@gmail.com"

  def correo_creado(usuario)
  	@usuario = usuario
  	mail subject: "Correo enviado", to: @usuario.emal
  end
end

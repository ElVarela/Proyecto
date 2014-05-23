class Usuario < ActiveRecord::Base
	
	validates_presence_of :nombre, :emal, :password
	validates_uniqueness_of :emal
	has_many :fotos
	
	def self.valida_login(emal,password)
		usuario = Usuario.find(:first, :conditions => ['emal = ?', emal])
		if usuario && usuario.password==password
			usuario
		else
			nil
		end
	end
end

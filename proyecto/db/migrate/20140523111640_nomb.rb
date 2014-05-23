class Nomb < ActiveRecord::Migration
  def change
  	rename_column :fotos, :id_usuario, :usuario_id
  end
end

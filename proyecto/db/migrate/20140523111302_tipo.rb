class Tipo < ActiveRecord::Migration
  def change
  	change_column :fotos, :id_usuario, :integer
  end
end

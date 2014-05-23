class AddForeignKeyToFotos < ActiveRecord::Migration
  def change
  	add_index :fotos, :id_usuario
  end
end

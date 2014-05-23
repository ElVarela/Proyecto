class AddIdUsuarioToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :id_usuario, :int
  end
end

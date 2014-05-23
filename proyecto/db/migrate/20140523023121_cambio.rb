class Cambio < ActiveRecord::Migration
  def self.up
     rename_column :usuarios, :password_digest, :password
   end
end

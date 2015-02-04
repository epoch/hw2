class RemovePagesFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :pages
  end
end

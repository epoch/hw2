class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.text :image
      t.float :area
      t.float :ports
      t.timestamps # You always want these
    end
  end
end

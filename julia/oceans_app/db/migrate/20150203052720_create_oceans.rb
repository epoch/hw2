class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.text :image
      t.integer :area
      t.integer :average_depth
      t.integer :deepest_point 
      t.timestamps
    end
  end
end

class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.text :image
      t.float :area
      t.float :depth
      t.float :mean_depth
      t.timestamps
    end
  end
end

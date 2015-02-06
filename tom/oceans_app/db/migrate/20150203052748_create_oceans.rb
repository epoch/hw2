class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.text :image
      t.float :max_depth
      t.float :earth_percentage
      t.string :countries
      t.timestamps
    end
  end
end

class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
        t.string :name 
        t.float :max_depth
        t.float :area
        t.float :volume
        t.text :image
        t.timestamps
    end
  end
end

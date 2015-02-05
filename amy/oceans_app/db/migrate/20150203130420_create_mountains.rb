class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|

        t.text :name
        t.integer :height
        t.text :country
        t.text :nearest_ocean
        t.text :image
        t.timestamps

    end
  end
end

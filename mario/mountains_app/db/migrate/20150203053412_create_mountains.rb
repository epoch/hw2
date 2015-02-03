class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.text :image
      t.integer :height
      t.text :country
      t.timestamps
    end
  end
end

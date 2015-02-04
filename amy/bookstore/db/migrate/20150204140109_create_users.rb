class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :name
        t.integer :age
        t.text :image
        t.timestamps
    end
  end
end

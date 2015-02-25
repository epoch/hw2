class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :year
      t.text :image
      t.timestamps
    end
  end
end

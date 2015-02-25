class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :year
      t.string :publisher
      t.string :genre
      t.string :isbn
      t.text :summary
      t.text :image
      t.integer :author_id
      t.timestamps
    end
  end
end

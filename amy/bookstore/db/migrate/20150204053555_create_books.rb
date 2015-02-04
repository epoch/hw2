class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
        t.string :title
        t.string :genre
        t.string :publisher
        t.string :year
        t.integer :isbn
        t.text :summary
        t.text :image
        t.integer :author_id
        t.timestamps
    end
  end
end

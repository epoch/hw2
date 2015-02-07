class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :date_published
      t.string :publisher
      t.string :description
      t.text :image
      t.integer :author_id
      t.timestamps
    end
  end
end

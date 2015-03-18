class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :year
      t.string :pages
      t.string :language
      t.string :genre
      t.text  :image
      t.integer :author_id
      t.timestamps
    end
  end
end

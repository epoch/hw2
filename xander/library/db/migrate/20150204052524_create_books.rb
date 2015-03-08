class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
        t.string :title
        t.string :published
        t.string :publisher
        t.integer :pages
        t.text :image
        t.text :award
        t.integer :author_id
    end
  end
end

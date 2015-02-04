class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
        t.string :name
        t.string :nationality
        t.date :dob 
        t.date :dod 
        t.string :university
        t.string :highlight
        t.integer :num_books
        t.text :image
    end
  end
end

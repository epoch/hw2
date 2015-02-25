class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :dob
      t.string :nationality
      t.text :image
      t.timestamps
    end
  end
end

class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.string :description
      t.string :nominee_name
      t.string :nominee_email
      t.text :banner_image
      t.string :cause
      t.string :target
      t.boolean :published
      t.date :end_date
      t.date :accepted_date
      t.date :completed_date
      t.date :donated_date
      t.integer :user_id
      t.timestamps
    end
  end
end

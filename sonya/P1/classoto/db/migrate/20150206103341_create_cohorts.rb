class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.integer :user_id
      t.string :cohort
      t.string :year
      t.timestamps
    end
  end
end

class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :goal
      t.integer :transportation
      t.integer :food
      t.integer :entertainment
      t.integer :daily
      t.integer :gass
      t.integer :electron
      t.integer :water
      t.integer :goals_other
      t.timestamps
    end
  end
end

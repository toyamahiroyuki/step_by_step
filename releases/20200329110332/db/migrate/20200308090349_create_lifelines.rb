class CreateLifelines < ActiveRecord::Migration[5.2]
  def change
    create_table :lifelines do |t|
      t.integer :user_id
      t.integer :electron
      t.integer :gass
      t.integer :water
      t.timestamps
    end
  end
end

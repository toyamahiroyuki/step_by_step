class CreateMovings < ActiveRecord::Migration[5.2]
  def change
    create_table :movings do |t|
      t.integer :user_id
      t.integer :moving_cost
      t.integer :distance
      t.integer :family
      t.integer :season
      t.timestamps
    end
  end
end

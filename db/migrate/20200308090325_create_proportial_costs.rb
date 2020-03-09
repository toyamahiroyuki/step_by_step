class CreateProportialCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :proportial_costs do |t|
      t.integer :user_id
      t.integer :transportation
      t.integer :food
      t.integer :entertainment
      t.integer :daily
      t.integer :proportial_costs_other
      t.timestamps
    end
  end
end

class CreateProportialCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :proportial_costs do |t|
      t.integer :user_id
      t.date :day
      t.integer :proportial_cost
      t.integer :proportial_cost_item
      t.string :proportial_cost_memo
      t.timestamps
    end
  end
end

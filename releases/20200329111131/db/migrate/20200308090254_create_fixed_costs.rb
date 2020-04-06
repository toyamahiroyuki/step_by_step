class CreateFixedCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_costs do |t|
      t.integer :user_id
      t.integer :rent
      t.integer :insurance
      t.integer :fixed_costs_other
      t.timestamps
    end
  end
end

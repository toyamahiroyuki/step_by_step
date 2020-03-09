class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.integer :fixed_costs_id
      t.integer :health
      t.integer :pension
      t.integer :resident
      t.integer :taxes_other
      t.timestamps
    end
  end
end

class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :fixed_cost_id
      t.string :loan_purpose
      t.integer :loan_cost
      t.timestamps
    end
  end
end

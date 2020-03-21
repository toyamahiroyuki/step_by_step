class CreateLoanItems < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_items do |t|
      t.integer :loan_id
      t.integer :loan_by_month
      t.integer :loan_balance
      t.timestamps
    end
  end
end

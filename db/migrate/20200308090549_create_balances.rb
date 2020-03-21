class CreateBalances < ActiveRecord::Migration[5.2]
  def change
    create_table :balances do |t|
      t.integer :user_id
      t.string :balance_purpose
      t.integer :balance_cost
      t.integer :balance_by_month
      t.timestamps
    end
  end
end

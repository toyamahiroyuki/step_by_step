class CreateBalances < ActiveRecord::Migration[5.2]
  def change
    create_table :balances do |t|
      t.integer :user_id
      t.integer :house
      t.integer :lesson
      t.integer :scholarship
      t.integer :balances_other
      t.timestamps
    end
  end
end

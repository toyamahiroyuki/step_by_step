class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :user_id
      t.date :day
      t.integer :income
      t.integer :income_item
      t.string :income_memo
      t.timestamps
    end
  end
end

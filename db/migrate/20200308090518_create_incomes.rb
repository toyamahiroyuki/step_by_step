class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :user_id
      t.integer :salary
      t.integer :allowance
      t.integer :retirement
      t.integer :incomes_other
      t.timestamps
    end
  end
end

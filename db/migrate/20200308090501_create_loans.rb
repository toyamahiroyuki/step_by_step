class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.integer :fixed_cost_id
      t.integer :house
      t.integer :lesson
      t.integer :scholarship
      t.integer :loans_other
      t.timestamps
    end
  end
end

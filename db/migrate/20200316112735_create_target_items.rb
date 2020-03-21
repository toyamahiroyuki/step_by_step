class CreateTargetItems < ActiveRecord::Migration[5.2]
  def change
    create_table :target_items do |t|
      t.integer :target_id
      t.integer :target_by_month
      t.integer :target_balance
      t.timestamps
    end
  end
end

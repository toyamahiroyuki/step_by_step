class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.integer :user_id
      t.string :target_purpose
      t.integer :target_cost
      t.timestamps
    end
  end
end

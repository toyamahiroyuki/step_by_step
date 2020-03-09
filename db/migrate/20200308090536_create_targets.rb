class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.integer :user_id
      t.integer :purpose
      t.integer :target
      t.timestamps
    end
  end
end

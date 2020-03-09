class CreateCommunications < ActiveRecord::Migration[5.2]
  def change
    create_table :communications do |t|
      t.integer :fixed_costs_id
      t.integer :phone
      t.integer :wi_fi
      t.integer :communications_other
      t.timestamps
    end
  end
end

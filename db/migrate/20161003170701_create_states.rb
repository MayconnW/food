class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :initials
      t.string :name
      t.integer :capital_id, index: true

      t.timestamps null: false
    end
  end
end
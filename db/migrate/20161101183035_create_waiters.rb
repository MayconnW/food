class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

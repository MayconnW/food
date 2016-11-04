class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :table
      t.references :customer, index: true, foreign_key: true
      t.references :waiter, index: true, foreign_key: true
      t.integer :status
      t.float :total

      t.timestamps null: false
    end
  end
end

class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :number_of_tables

      t.timestamps null: false
    end
  end
end

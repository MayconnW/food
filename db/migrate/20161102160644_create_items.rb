class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :sale, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.boolean :to_go

      t.timestamps null: false
    end
  end
end

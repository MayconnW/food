class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.float :price
      t.attachment :photo
      t.text :description

      t.timestamps null: false
    end
  end
end

class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :phone
      t.string :address
      t.string :number
      t.references :city, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.attachment :photo

      t.timestamps null: false
    end
  end
end

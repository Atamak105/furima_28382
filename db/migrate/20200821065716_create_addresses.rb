class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :item_purchases_id, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :tel, null: false
      t.timestamps
    end
  end
end

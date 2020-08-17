class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id, null:false, foreign_key: true
      t.string :image, null:false
      t.string :name, null:false
      t.text :explanation, null:false
      t.integer :category_id, null:false
      t.integer :status_id, null:false
      t.integer :shipping_charges_id, null:false
      t.integer :area_id, null:false
      t.integer :delivery_id, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end

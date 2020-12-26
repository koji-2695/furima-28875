class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :price,  null: false
      t.string :item_name,  null: false
      t.text :explanation,  null: false
      t.integer :lister_id,  null: false
      t.integer :category_id,  null: false
      t.integer :condition_id,  null: false
      t.integer :shipping_fee_id,  null: false
      t.integer :area_id,  null: false
      t.integer :shipping_date_id,  null: false
      t.integer :user_id,  null: false,   foreign_key: true
      t.timestamps
    end
  end
end

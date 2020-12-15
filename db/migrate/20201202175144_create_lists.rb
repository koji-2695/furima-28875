class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|

      t.integer :price
      t.string :item_name
      t.text :explanation
      t.integer :lister_id
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_fee_id
      t.integer :area_id
      t.integer :shipping_date_id
      t.timestamps
    end
  end
end

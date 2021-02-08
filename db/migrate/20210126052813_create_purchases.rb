class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|

      t.references :user_id
      t.references :list_id
      t.timestamps
    end
  end
end

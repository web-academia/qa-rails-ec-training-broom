class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :purchase_price
      t.integer :purchase_quantity
      t.string :purchase_company, :limit => 128
      t.datetime :order_date
      t.datetime :purchase_date
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name, :limit => 64
      t.integer :category_id
      t.integer :price
      t.string :description, :limit => 256
      t.integer :sale_status_id
      t.integer :product_status_id
      t.datetime :regist_date
      t.integer :user_id
      t.boolean :delete_flag

      t.timestamps
    end
  end
end

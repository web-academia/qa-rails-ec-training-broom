class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name, :limit => 64
      t.references :category, foreign_key: true
      t.integer :price
      t.string :description, :limit => 256
      t.references :sale_status, foreign_key: true
      t.references :product_status, foreign_key: true
      t.datetime :regist_date
      # TODO: User関係の構築ができたタイミングでコメントアウトを解除すること
      t.references :user, foreign_key: true
      t.boolean :delete_flag

      t.timestamps
    end
  end
end

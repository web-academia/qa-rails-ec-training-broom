class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      # TODO: User関係の構築ができたタイミングでコメントアウトを解除すること
      t.references :user, foreign_key: true
      t.datetime :order_date
      t.string :order_number, :limit => 16

      t.timestamps
    end
  end
end

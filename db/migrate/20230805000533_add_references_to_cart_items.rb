class AddReferencesToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :product, foreign_key: true
  end
end

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :category_name, :limit => 32

      t.timestamps
    end
  end
end

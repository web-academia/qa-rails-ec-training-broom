class CreateUserClassfications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_classfications do |t|
      t.string :user_classfication_name, :limit => 32
      t.timestamps
    end
  end
end

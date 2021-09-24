class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :amount
      t.float :sale_price

      t.timestamps
    end
  end
end

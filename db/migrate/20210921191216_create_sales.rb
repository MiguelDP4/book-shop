class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.integer :amount
      t.float :unit_price

      t.timestamps
    end
  end
end

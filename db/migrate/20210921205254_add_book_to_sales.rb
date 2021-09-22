class AddBookToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :book, null: false, foreign_key: true
  end
end

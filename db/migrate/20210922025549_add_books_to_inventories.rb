class AddBooksToInventories < ActiveRecord::Migration[6.1]
  def change
    add_reference :inventories, :book, null: false, foreign_key: true
  end
end

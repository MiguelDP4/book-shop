class Inventory < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :sale_price, presence: true, numericality: { greater_than: 1, less_than_or_equal_to: 50 }
  validates :amount, presence: true
  validates :book_id, presence: true
  belongs_to :user
  belongs_to :book
  has_many :cart_items
  has_many :sales
end

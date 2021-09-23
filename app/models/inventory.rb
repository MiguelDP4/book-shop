class Inventory < ApplicationRecord
  validates :user_id, presence: true
  validates :sale_price, presence: true
  validates :amount, presence: true
  validates :book_id, presence: true
  belongs_to :user, optional: true
  belongs_to :sale, optional: true
  belongs_to :book
  has_many :cart_items
end

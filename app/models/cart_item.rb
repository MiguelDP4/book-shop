class CartItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :cart, optional: true
  validates :amount, presence: true, numericality: { greater_than: 1 }
end

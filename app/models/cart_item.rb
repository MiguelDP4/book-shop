class CartItem < ApplicationRecord
  has_many :inventories
  belongs_to :cart, optional: true
end

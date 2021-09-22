class CartItem < ApplicationRecord
  has_one :inventory
  belongs_to :cart, optional: true
end

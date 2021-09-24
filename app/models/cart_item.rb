class CartItem < ApplicationRecord
  belongs_to :inventory
  belongs_to :cart, optional: true
end

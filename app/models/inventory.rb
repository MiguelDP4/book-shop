class Inventory < ApplicationRecord
  belongs_to :user, optional: true
  has_one :book
  belongs_to :cart_item, optional: true
end

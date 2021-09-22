class Inventory < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :sale, optional: true
  belongs_to :book
  has_many :cart_items
end

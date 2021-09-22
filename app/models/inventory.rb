class Inventory < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :cart_item, optional: true
  belongs_to :sale, optional: true
  belongs_to :book
end

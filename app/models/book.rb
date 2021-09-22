class Book < ApplicationRecord
  belongs_to :sale, optional: true
  belongs_to :cart_item, optional: true
  belongs_to :inventory, optional: true
end

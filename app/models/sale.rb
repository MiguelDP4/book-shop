class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :inventory
end

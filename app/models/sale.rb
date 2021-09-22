class Sale < ApplicationRecord
  belongs_to :user, optional: true
  has_one :book
end

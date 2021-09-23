class Book < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :author, presence: true
  has_many :inventories
end

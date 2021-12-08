class Category < ApplicationRecord
  has_many :listItems, dependent: :destroy
  validates :category, presence: true
end

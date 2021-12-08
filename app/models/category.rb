class Category < ApplicationRecord
  has_many :listItems, dependent: :destroy
  has_many :users, through: :listItems
  validates :category, presence: true
end

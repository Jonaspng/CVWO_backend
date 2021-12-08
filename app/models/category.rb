class Category < ApplicationRecord
  belongs_to :user
  has_many :listItems
  validates :category, presence: true
end

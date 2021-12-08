class Category < ApplicationRecord
  belongs_to :user
  has_many :listItems, dependent: :destroy
  validates :category, presence: true
end

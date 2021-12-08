class Category < ApplicationRecord
  has_many :listItems, dependent: :destroy
  belongs_to :user
  validates :category, presence: true
end

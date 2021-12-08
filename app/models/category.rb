class Category < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  has_many :listItems,  dependent: :destroy
end

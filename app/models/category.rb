class Category < ApplicationRecord
  belongs_to :user
  validates :category, presence: true
  has_many :list_items, dependent: :delete_all
end

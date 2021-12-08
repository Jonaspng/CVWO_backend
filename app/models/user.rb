class User < ApplicationRecord
  has_many :list_items
  has_many :categories
  #Downcase email before saving
  before_save {self.email = email.downcase}
  # Help checks for valid email address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 105},
                    format: {with: VALID_EMAIL_REGEX}
  validates :username, presence: true,
                       length: {minimum: 5, maximum: 30}
  has_secure_password
  validates :password, presence: {on: create}, 
                       length: {minimum: 8}, 
                       :if => :password_digest_changed?
end

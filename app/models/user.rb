class User < ApplicationRecord
    has_many :articles
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { in: 3..32 }, uniqueness: { case_sensitive: false }
    validates :email, presence: true, length: { in: 6..105 }, uniqueness: { case_sensitive: false }, 
    format: { with: VALID_EMAIL_REGEX }
end

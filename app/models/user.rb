class User < ApplicationRecord
    before_save {self.email=email.downcase}
    has_many :articles
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true, length: { in: 3..32 }, uniqueness: { case_sensitive: false }
    validates :email, presence: true, length: { in: 6..105 }, uniqueness: { case_sensitive: false }, 
    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end

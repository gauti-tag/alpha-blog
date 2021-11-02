class User < ApplicationRecord
 before_save { self.email = email.downcase } # tranform to lowercase before saving
 has_many :articles, dependent: :destroy
 validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # https://rubular.com/ for testing regex expression 

 validates :email, presence: true, 
                   uniqueness: { case_sensitive: false }, 
                   length: { maximum: 100 },
                   format: { with: VALID_EMAIL_REGEX }

  has_secure_password
end
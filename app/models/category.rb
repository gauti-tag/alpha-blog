class Category < ApplicationRecord 
  validates :name, presence: true, length: {minimum:3, maximum:25}
  validates_uniqueness_of :name # or uniqueness: { case_sensitive: false }
  has_many :article_categories
  has_many :articles, through: :article_categories
end
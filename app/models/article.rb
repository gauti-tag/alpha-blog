class Article < ApplicationRecord

  validates :title, presence: true, length: { in: 3..100 }
  validates :desciption, presence: true, length: {in: 20..300}

  belongs_to :user

  has_many :article_categories
  has_many :categories, through: :article_categories

end
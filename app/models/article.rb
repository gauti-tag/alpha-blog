class Article < ApplicationRecord

  validates :title, presence: true, length: { in: 3..100 }
  validates :desciption, presence: true, length: {in: 20..300}

  belongs_to :user

end
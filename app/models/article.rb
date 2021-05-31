class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { in: 5..300 }

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
end
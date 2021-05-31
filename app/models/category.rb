class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {in: 3...25}
  
  has_many :article_categories
  has_many :articles, through: :article_categories
end
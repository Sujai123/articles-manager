class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { in: 5..100 }
end
class Article < ApplicationRecord
  validates :title, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { in: 5..300 }

  belongs_to :user
end
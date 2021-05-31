class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username,
            uniqueness: {case_sensitive: false},
            presence: true,
            length: { in: 3...30 }

  validates :email,
            uniqueness: {case_sensitive: false},
            presence: true,
            length: { in: 3...30 },
            format: {with: VALID_EMAIL_REGEX}

  has_secure_password

  has_many :articles, dependent: :destroy
end
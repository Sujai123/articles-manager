class Community < ApplicationRecord
  has_many :config_settings, as: :configurable
  has_one :sso_detail, as: :configurable
end
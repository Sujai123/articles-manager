class ConfigSetting < ApplicationRecord
  belongs_to :configurable, polymorphic: true
end
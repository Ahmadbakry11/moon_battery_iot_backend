# frozen_string_literal: true

class BatteryConfiguration < ApplicationRecord
  belongs_to :moon_battery

  validates :config_name, :config_value, presence: true
  validates :config_name, uniqueness: { scope: :moon_battery_id }
end

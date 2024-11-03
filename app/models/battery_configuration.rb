# frozen_string_literal: true

class BatteryConfiguration < ApplicationRecord
  belongs_to :moon_battery

  validates :config_name, :config_value, presence: true
  validates :config_name, uniqueness: { scope: :moon_battery_id }

  class <<  self
    def update_collection(moon_battery, configurations)
      configurations.each do |config|
        configuration = moon_battery.battery_configurations.find_or_initialize_by(config_name: config[:config_name])
        configuration[:config_value] = config[:config_value]
        configuration.save!
      end
    end
  end
end

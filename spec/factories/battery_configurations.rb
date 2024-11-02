# frozen_string_literal: true

FactoryBot.define do
  factory :battery_configuration do
    config_name { "setting_#{Faker::Alphanumeric.unique.alphanumeric(number: 5)}" }
    config_value { "value_#{Faker::Alphanumeric.unique.alphanumeric(number: 5)}" }
    moon_battery { create :moon_battery }
  end
end
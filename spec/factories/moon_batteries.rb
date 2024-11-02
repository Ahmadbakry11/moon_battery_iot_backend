# frozen_string_literal: true

FactoryBot.define do
  factory :moon_battery do
    mac_address { Faker::Internet.unique.mac_address }
    last_contact_at { Time.current }
  end
end

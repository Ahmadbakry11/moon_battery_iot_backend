# frozen_string_literal: true

class MoonBattery < ApplicationRecord
  MAC_ADDRESS_FORMAT = /\A([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\Z/

  has_secure_token :serial_number

  has_many :battery_configurations, dependent: :destroy

  validates :mac_address, :serial_number, presence: true
  validates :mac_address, :serial_number, uniqueness: true
  validates :mac_address, format: { with: MAC_ADDRESS_FORMAT, message: 'invalid MAC address' }

  def ping
    update(last_contact_at: Time.current)
  end
end

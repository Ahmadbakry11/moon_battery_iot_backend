# frozen_string_literal: true

RSpec.describe MoonBattery, type: :model do
  describe 'presence validations' do
    it { should validate_presence_of(:mac_address) }
    it { should validate_presence_of(:serial_number) }
  end

  describe 'mac_address format validations' do
    it { should allow_value('00:1A:2B:3C:4D:5E').for(:mac_address) }
    it { should allow_value('00-1A-2B-3C-4D-5E').for(:mac_address) }
    it { should_not allow_value('001A2B3C4D5E').for(:mac_address) }
    it { should_not allow_value('00:1A:2B:3C:4D').for(:mac_address) }
    it { should_not allow_value('G0:1A:2B:3C:4D:5E').for(:mac_address) }
  end

  describe 'uniqueness validations' do
    let!(:moon_battery) { create :moon_battery }
    it { should validate_uniqueness_of(:mac_address) }
    it { should validate_uniqueness_of(:serial_number) }
  end
end

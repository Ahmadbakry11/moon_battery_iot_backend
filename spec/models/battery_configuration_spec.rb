# frozen_string_literal: true

RSpec.describe BatteryConfiguration, type: :model do
  describe 'presence validations' do
    it { should validate_presence_of(:config_name) }
    it { should validate_presence_of(:config_value) }
  end

  describe 'uniqueness validation of config_name scoped to battery' do
    let!(:battery) { create :moon_battery }
    let!(:battery_configuration) { create :battery_configuration, battery: battery }
    it { should validate_uniqueness_of(:config_name).scoped_to(:battery_id) }
  end

  describe 'association between moon_battery and battery_configuration' do
    it { should belong_to(:moon_battery) }
  end  
end
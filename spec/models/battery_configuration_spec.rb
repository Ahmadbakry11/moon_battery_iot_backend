# frozen_string_literal: true

RSpec.describe BatteryConfiguration, type: :model do
  describe 'presence validations' do
    it { should validate_presence_of(:config_name) }
    it { should validate_presence_of(:config_value) }
  end

  describe 'uniqueness validation of config_name scoped to moon_battery' do
    let!(:moon_battery) { create :moon_battery }
    let!(:battery_configuration) { create :battery_configuration, moon_battery: moon_battery }
    it { should validate_uniqueness_of(:config_name).scoped_to(:moon_battery_id) }
  end

  describe 'association between moon_battery and battery_configuration' do
    it { should belong_to(:moon_battery) }
  end

  describe 'update_collection method for updating multiple configurations' do
    let!(:moon_battery) { create :moon_battery }
    let!(:configurations) {
      [
        { config_name: 'setting1', config_value: 'value1' },
        { config_name: 'setting2', config_value: 'value2' }
      ]
    }

    it 'should update or create configurations of the moon_battery' do
      BatteryConfiguration.update_collection(moon_battery, configurations)

      expect(moon_battery.battery_configurations.find_by(config_name: 'setting1').config_value).to eq('value1')
      expect(moon_battery.battery_configurations.find_by(config_name: 'setting2').config_value).to eq('value2')
    end
  end
end

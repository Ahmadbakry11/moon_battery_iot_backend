# frozen_string_literal: true

RSpec.describe BatteryConfigurationsController, type: :request do
  describe 'PUT /moon_batteries/:serial_number/configurations' do
    let!(:moon_battery) { create :moon_battery }
    let!(:serial_number) { moon_battery.serial_number }

    before { put "/moon_batteries/#{serial_number}/configurations", params: params }

    context 'when the provided moon_battery serial number exists' do
      context 'when the provided params are all valid' do
        let!(:params) do
          {
            configurations: [
              { config_name: 'setting1', config_value: 'value1' },
              { config_name: 'setting2', config_value: 'value2' }
            ]
          }
        end

        it 'returns status of no_content' do
          expect(response).to have_http_status(:no_content)
        end

        it 'saves the configurations' do
          expect(moon_battery.battery_configurations.find_by(config_name: 'setting1').config_value).to eq('value1')
          expect(moon_battery.battery_configurations.find_by(config_name: 'setting2').config_value).to eq('value2')
        end
      end

      context 'when the provided params are all invalid' do
        let!(:params) do
          {
            configurations: [
              { config_name: '', config_value: 'value1' }
            ]
          }
        end

        it 'does not save the configurations and return an error' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context 'when the provided moon_battery serial number does not exist' do
      let!(:serial_number) { 'invalid_serail_number' }

      let!(:params) do
        {
          configurations: [
            { config_name: 'setting1', config_value: 'value1' }
          ]
        }
      end

      it 'returns a not_found error' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end

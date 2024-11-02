RSpec.describe MoonBatteriesController, type: :request do
  describe 'POST /register endpoint' do
    before  { post '/register', params: moon_battery_params }

    context 'when the provided moon_battery_params are valid' do
      let!(:moon_battery_params) { { moon_battery: { mac_address: "e5:ee:bf:2d:60:62" } } }
  
      it 'creates a new moon battery' do
        expect(response).to have_http_status(:created)
        expect(json_body['serial_number']).not_to be_nil
      end
    end
  
    context 'when the provided moon_battery_params are invalid' do
      let!(:moon_battery_params) { { moon_battery: { mac_address: "MACAddress" } } }
  
      it 'does not create the moon battery and return an error' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body['message']).to match(/Validation failed/)
      end
    end
  end
end
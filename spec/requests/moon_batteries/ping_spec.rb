# frozen_string_literal: true

RSpec.describe MoonBatteriesController, type: :request do
  describe 'ping endpoint' do
    let!(:moon_battery) { create :moon_battery }
    let!(:unauthorized_moon_battery) { create :moon_battery }
    let!(:serial_number) { moon_battery.serial_number }

    describe 'PUT /moon_batteries/:serial_number/ping' do
      context 'when the battery making the request is authenticated' do
        before { put "/moon_batteries/#{serial_number}/ping", headers: { 'Authorization' => moon_battery.auth_token } }

        context 'when the target moon battery exists, i.e. valid serial_number' do
          it 'returns no_content status' do
            expect(response).to have_http_status(:no_content)
          end

          it 'touches the current battery and updates the updated_at time' do
            expect(moon_battery.reload.last_contact_at).to be_within(1.second).of(Time.current)
          end
        end

        context 'when the target moon battery does not exists, i.e. invalid serial_number' do
          let(:serial_number) { 'invalid_number' }

          it 'returns not_found status error' do
            expect(response).to have_http_status(:not_found)
          end
        end

        context 'when the current battery is authenticated but is trying to ping another battery' do
          before do
            put "/moon_batteries/#{serial_number}/ping",
                headers: { 'Authorization' => unauthorized_moon_battery.auth_token }
          end

          it 'returns forbidden status error' do
            expect(response).to have_http_status(:forbidden)
          end
        end
      end

      context 'when the battery making the request is not authenticated' do
        context 'When the Authorization header is missing' do
          before { put "/moon_batteries/#{serial_number}/ping" }

          it 'returns unauthorized status' do
            expect(response).to have_http_status(:unauthorized)
          end
        end

        context 'When the Authorization header is existing with invalid token' do
          before { put "/moon_batteries/#{serial_number}/ping", headers: { 'Authorization' => 'invalid_token' } }

          it 'returns unauthorized status' do
            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end
end

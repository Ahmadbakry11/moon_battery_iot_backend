# frozen_string_literal: true

RSpec.describe MoonBatteriesController, type: :request do
  describe 'PUT /moon_batteries/:serial_number/ping' do
    let!(:moon_battery) { create :moon_battery }
    let!(:serial_number) { moon_battery.serial_number }

    before { put "/moon_batteries/#{serial_number}/ping" }

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
  end
end

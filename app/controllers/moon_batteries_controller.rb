# frozen_string_literal: true

class MoonBatteriesController < ApplicationController
  before_action :authenticate_battery!, only: [:ping]
  before_action :set_moon_battery, only: [:ping]

  def register
    @moon_battery = MoonBattery.create!(moon_battery_params)

    response = {
      serial_number: @moon_battery.serial_number,
      auth_token: @moon_battery.auth_token
    }

    json_response(response, :created)
  end

  def ping
    @moon_battery.ping

    head :no_content
  end

  private

  def set_moon_battery
    @moon_battery = MoonBattery.find_by!(serial_number: params[:serial_number])
  end

  def moon_battery_params
    params.require(:moon_battery).permit(:mac_address)
  end
end

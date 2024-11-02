# frozen_string_literal: true

class MoonBatteriesController < ApplicationController
  def register
    @moon_battery = MoonBattery.create!(moon_battery_params)
    response = { serial_number: @moon_battery.serial_number }

    json_response(response, :created)
  end

  private

  def moon_battery_params
    params.require(:moon_battery).permit(:mac_address)
  end
end

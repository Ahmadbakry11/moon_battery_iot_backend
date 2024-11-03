# frozen_string_literal: true

class BatteryConfigurationsController < ApplicationController
  before_action :authenticate_battery!, only: [:update]
  before_action :set_moon_battery, only: [:update]

  def update
    authorize @moon_battery, :update?

    BatteryConfiguration.update_collection(@moon_battery, params[:configurations])

    head :no_content
  end

  private

  def set_moon_battery
    @moon_battery = MoonBattery.find_by!(serial_number: params[:moon_battery_serial_number])
  end

  def battery_configuration_params
    params.require(:configurations).map do |config|
      config.permit(:config_name, :config_value)
    end
  end
end

# frozen_string_literal: true

class CreateBatteryConfigurations < ActiveRecord::Migration[7.1]
  def change
    create_table :battery_configurations do |t|
      t.references :moon_battery, null: false, foreign_key: true
      t.string :config_name, null: false
      t.string :config_value, null: false

      t.timestamps
    end

    add_index :battery_configurations, %i[moon_battery_id config_name], unique: true
  end
end

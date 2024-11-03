# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_241_102_080_000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'battery_configurations', force: :cascade do |t|
    t.bigint 'moon_battery_id', null: false
    t.string 'config_name', null: false
    t.string 'config_value', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[moon_battery_id config_name], name: 'idx_on_moon_battery_id_config_name_27bcb44cee', unique: true
    t.index ['moon_battery_id'], name: 'index_battery_configurations_on_moon_battery_id'
  end

  create_table 'moon_batteries', force: :cascade do |t|
    t.string 'mac_address', null: false
    t.string 'serial_number', null: false
    t.string 'auth_token', null: false
    t.datetime 'last_contact_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['auth_token'], name: 'index_moon_batteries_on_auth_token', unique: true
    t.index ['mac_address'], name: 'index_moon_batteries_on_mac_address', unique: true
    t.index ['serial_number'], name: 'index_moon_batteries_on_serial_number', unique: true
  end

  add_foreign_key 'battery_configurations', 'moon_batteries'
end

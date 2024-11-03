# frozen_string_literal: true

class CreateMoonBatteries < ActiveRecord::Migration[7.1]
  def change
    create_table :moon_batteries do |t|
      t.string :mac_address, null: false
      t.string :serial_number, null: false
      t.string :auth_token, null: false
      t.datetime :last_contact_at

      t.timestamps
    end

    add_index :moon_batteries, :mac_address, unique: true
    add_index :moon_batteries, :serial_number, unique: true
    add_index :moon_batteries, :auth_token, unique: true
  end
end

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

ActiveRecord::Schema[7.1].define(version: 20_240_506_011_622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'addresses', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'address'
    t.string 'address_number'
    t.string 'complement'
    t.string 'zip_code'
    t.string 'state'
    t.string 'city'
    t.string 'neighborhood'
    t.string 'addressable_type', null: false
    t.uuid 'addressable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address'], name: 'index_addresses_on_address'
    t.index ['address_number'], name: 'index_addresses_on_address_number'
    t.index %w[addressable_type addressable_id], name: 'index_addresses_on_addressable'
    t.index ['city'], name: 'index_addresses_on_city'
    t.index ['complement'], name: 'index_addresses_on_complement'
    t.index ['neighborhood'], name: 'index_addresses_on_neighborhood'
    t.index ['state'], name: 'index_addresses_on_state'
    t.index ['zip_code'], name: 'index_addresses_on_zip_code'
  end

  create_table 'contacts', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'document'
    t.uuid 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['document'], name: 'index_contacts_on_document', unique: true
    t.index ['email'], name: 'index_contacts_on_email', unique: true
    t.index ['name'], name: 'index_contacts_on_name'
    t.index ['user_id'], name: 'index_contacts_on_user_id'
  end

  create_table 'phones', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'area_code'
    t.string 'phone_number'
    t.string 'phoneble_type', null: false
    t.uuid 'phoneble_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['area_code'], name: 'index_phones_on_area_code'
    t.index ['phone_number'], name: 'index_phones_on_phone_number'
    t.index %w[phoneble_type phoneble_id], name: 'index_phones_on_phoneble'
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.string 'confirmation_token'
    t.string 'password_reset_token'
    t.datetime 'password_reset_sent_at'
    t.datetime 'confirmation_token_sent_at'
    t.boolean 'confirmed', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['confirmation_token_sent_at'], name: 'index_users_on_confirmation_token_sent_at'
    t.index ['confirmed'], name: 'index_users_on_confirmed'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['name'], name: 'index_users_on_name'
    t.index ['password_digest'], name: 'index_users_on_password_digest'
    t.index ['password_reset_sent_at'], name: 'index_users_on_password_reset_sent_at'
    t.index ['password_reset_token'], name: 'index_users_on_password_reset_token', unique: true
  end

  add_foreign_key 'contacts', 'users'
end

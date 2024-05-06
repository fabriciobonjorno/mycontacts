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

ActiveRecord::Schema[7.1].define(version: 20_240_505_235_758) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

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
end

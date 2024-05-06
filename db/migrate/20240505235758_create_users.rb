# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    return if table_exists? 'users'

    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :confirmation_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.datetime :confirmation_token_sent_at
      t.boolean :confirmed, default: false

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :password_digest
    add_index :users, :email, unique: true
    add_index :users, :confirmed
    add_index :users, :confirmation_token, unique: true
    add_index :users, :password_reset_token, unique: true
    add_index :users, :password_reset_sent_at
    add_index :users, :confirmation_token_sent_at
  end
end

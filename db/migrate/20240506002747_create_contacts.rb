# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    return if table_exists? 'contacts'

    create_table :contacts, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :document
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :contacts, :name
    add_index :contacts, :email, unique: true
    add_index :contacts, :document, unique: true
  end
end

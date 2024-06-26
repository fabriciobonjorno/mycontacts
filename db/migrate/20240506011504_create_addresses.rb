# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    return if table_exists? 'addresses'

    create_table :addresses, id: :uuid do |t|
      t.string :address
      t.string :address_number
      t.string :complement
      t.string :zip_code
      t.string :state
      t.string :city
      t.string :neighborhood
      t.references :addressable, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
    add_index :addresses, :zip_code
    add_index :addresses, :address
    add_index :addresses, :address_number
    add_index :addresses, :complement
    add_index :addresses, :state
    add_index :addresses, :city
    add_index :addresses, :neighborhood
  end
end

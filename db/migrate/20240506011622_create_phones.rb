# frozen_string_literal: true

class CreatePhones < ActiveRecord::Migration[7.1]
  def change
    return if table_exists? 'phones'

    create_table :phones, id: :uuid do |t|
      t.string :area_code
      t.string :phone_number
      t.references :phoneble, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
    add_index :phones, :area_code
    add_index :phones, :phone_number
  end
end

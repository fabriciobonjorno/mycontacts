# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address { 'MyString' }
    address_number { 'MyString' }
    complement { 'MyString' }
    zip_code { 'MyString' }
    state { 'MyString' }
    city { 'MyString' }
    neighborhood { 'MyString' }
    addressable { nil }
  end
end

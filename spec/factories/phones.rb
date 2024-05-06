# frozen_string_literal: true

FactoryBot.define do
  factory :phone do
    area_code { 'MyString' }
    phone_number { 'MyString' }
    phoneble { nil }
  end
end

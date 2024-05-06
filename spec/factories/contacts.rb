# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    document { Faker::IdNumber.brazilian_citizen_number }
    association :user
  end
end

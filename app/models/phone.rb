# frozen_string_literal: true

class Phone < ApplicationRecord
  # Validates
  validates :area_code, :phone_number, presence: true
  validates :phone_number, uniqueness: true, scope: %i[user_id]

  # relationships
  belongs_to :phoneble, polymorphic: true
end

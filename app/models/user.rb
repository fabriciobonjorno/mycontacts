# frozen_string_literal: true

class User < ApplicationRecord
  # Validates
  validates :name, :password_digest, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end

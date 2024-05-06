# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Relationships
  has_many :contacts, dependent: :destroy
  has_one :address, as: :addressable
  has_many :phones, as: :phoneble

  # Validates
  validates :name, :password_digest, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validate :password_regex
  validate :email_regex

  # Normalizes
  normalizes :email, with: -> { _1.strip.downcase }
  normalizes :name, with: -> { _1.gsub(/\d/, '').strip }

  # Public methods
  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64
    self.confirmation_token_sent_at = Time.now
    save
  end

  def generate_reset_password
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.now
    save
  end

  # Private methods
  private

  def capitalize_name
    self.name = Util.capitalize_name(name) if name_changed?
  end

  def password_regex
    return if password.blank? || Util.password_regex(password)

    errors.add :base, 'Senha deve conter 6 caracteres'
  end

  def email_regex
    return if email.blank? || Util.email_regex(email)

    errors.add :base, 'Use um e-mail válido'
  end
end

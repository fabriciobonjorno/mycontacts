# frozen_string_literal: true

class Contact < ApplicationRecord
  # Relationship
  belongs_to :user

  # Validates
  validates :name, :document, :email, presence: true
  validates :email, :document, uniqueness: { case_sensitive: false, scope: %i[user_id] }

  # Normalizes
  normalizes :email, with: -> { _1.strip.downcase }
  normalizes :document, with: -> { _1.gsub(/\D/, '').strip }

  private

  def valid_document
    unless (document.length == 11 && CPF.valid?(document)) ||
           (document.length == 14 && CNPJ.valid?(document))
      errors.add :base, 'Documento inválido'
    end
  end
end

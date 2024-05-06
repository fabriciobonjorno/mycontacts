# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive.scoped_to(:user_id) }
  it { is_expected.to validate_presence_of(:document) }
  it { is_expected.to validate_uniqueness_of(:document).case_insensitive.scoped_to(:user_id) }
end

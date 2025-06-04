# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    create(:user)
  end

  it { is_expected.to have_secure_password }

  describe 'validation' do
    it { is_expected.to validate_uniqueness_of(:email_address).case_insensitive }
  end
end

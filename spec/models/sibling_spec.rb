# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sibling, type: :model do
  before do
    create(:sibling)
  end

  it { is_expected.to have_many(:posts) }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:birthday) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_length_of(:name).is_at_least(2).is_at_most(20) }
  end
end

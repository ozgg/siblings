# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    create(:post)
  end

  it { is_expected.to belong_to(:sibling) }
  it { is_expected.to have_one_attached(:image) }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_uniqueness_of(:date).scoped_to(:sibling_id) }
    it { is_expected.to validate_length_of(:title).is_at_most(250) }
  end
end

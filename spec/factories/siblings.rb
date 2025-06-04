# frozen_string_literal: true

FactoryBot.define do
  factory :sibling do
    sequence(:name) { |n| "Sibling #{n}" }
    birthday { '2020-06-10' }
  end
end

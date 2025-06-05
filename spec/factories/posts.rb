# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    sibling
    sequence(:date) { |d| d.days.ago }
    body { 'Description of another day' }
  end
end

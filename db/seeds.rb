# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

[%w[Паша 2020-06-10], %w[Лиза 2025-05-19]].each do |data|
  next if Sibling.exists?(name: data[0])

  Sibling.create!(name: data[0], birthday: data[1])
end

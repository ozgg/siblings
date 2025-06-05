# frozen_string_literal: true

# Sibling
#
# Attributes:
#   birthday [Date]
#   name [String]
class Sibling < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :birthday, presence: true
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 2, maximum: 20 }
end

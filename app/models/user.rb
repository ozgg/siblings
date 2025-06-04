# frozen_string_literal: true

# User
#
# Attributes:
#   created_at [DateTime], optional
#   email_address [String]
#   password_digest [String]
#   updated_at [Datetime], optional
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address,
            presence: true,
            uniqueness: true
end

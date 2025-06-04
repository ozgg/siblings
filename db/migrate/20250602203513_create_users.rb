# frozen_string_literal: true

# Create users table for authentication
class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false, index: { unique: true }
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

# frozen_string_literal: true

# Create sessions table for authentication
class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.inet :ip_address
      t.string :user_agent
      t.timestamps
    end
  end
end

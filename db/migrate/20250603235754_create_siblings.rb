# frozen_string_literal: true

# Create table for Sibling model
class CreateSiblings < ActiveRecord::Migration[8.0]
  def change
    # rubocop:disable Rails/CreateTableWithTimestamps
    create_table :siblings, comment: 'Siblings' do |t|
      t.string :name, index: { unique: true }
      t.date :birthday
    end
    # rubocop:enable Rails/CreateTableWithTimestamps
  end
end

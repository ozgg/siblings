# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts, comment: 'Post in diary' do |t|
      t.references :sibling, null: false, foreign_key: { on_update: :cascade, on_delete: :cascade }
      t.date :date, null: false
      t.string :title, default: '', null: false
      t.text :body, null: false
      t.timestamps
    end

    add_index :posts, %i[date sibling_id], unique: true
  end
end

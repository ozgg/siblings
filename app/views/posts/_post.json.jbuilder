# frozen_string_literal: true

json.extract! post, :id, :sibling_id, :date, :title, :body, :created_at, :updated_at
json.url post_url(post, format: :json)

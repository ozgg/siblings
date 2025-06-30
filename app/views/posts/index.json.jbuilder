# frozen_string_literal: true

json.array! @collection, partial: 'posts/post', as: :post

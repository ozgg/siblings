# frozen_string_literal: true

# Current user or session retriever
class Current < ActiveSupport::CurrentAttributes
  attribute :session
  delegate :user, to: :session, allow_nil: true
end

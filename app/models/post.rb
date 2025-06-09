# frozen_string_literal: true

# Post with description of a day
#
# Attributes:
#   body [Text]
#   created_at [DateTime]
#   date [Date]
#   sibling_id [Sibling]
#   title [String]
#   updated_at [DateTime]
class Post < ApplicationRecord
  belongs_to :sibling

  has_one_attached :image do |attachable|
    attachable.variant :hd, resize_to_fit: [1920, 1920]
    attachable.variant :large, resize_to_fit: [1280, 1280]
    attachable.variant :medium, resize_to_fit: [640, 640]
    attachable.variant :small, resize_to_fit: [320, 320]
  end

  validates :body,
            presence: true

  validates :date,
            presence: true,
            uniqueness: { scope: :sibling_id }

  validates :title,
            length: { maximum: 250 }

  scope :ordered, -> { order(date: :desc, sibling_id: :asc) }
  scope :list, ->(page = 1) { ordered.page(page) }

  def self.permitted_params
    %i[body date image sibling_id title]
  end
end

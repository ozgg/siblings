# frozen_string_literal: true

module DiaryHelper

  # @param [Post|Date] entity
  # @param [String] text
  # @param [Hash] options
  def diary_entry_link(entity, text = entity.title_for_page, options = {})
    date = entity.is_a?(Post) ? entity.date : entity
    link_to(text, diary_entry_path(date: date.strftime('%F')), options)
  end

  # Entry title with sibling name and post title, if present
  #
  # @param [Post] entity
  def diary_entry_title(entity)
    if entity.title.blank?
      entity.sibling.name
    else
      "#{entity.sibling.name}: #{entity.title}"
    end
  end
end

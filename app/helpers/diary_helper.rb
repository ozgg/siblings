# frozen_string_literal: true

module DiaryHelper

  # @param [Post] entity
  # @param [String] text
  def diary_entry_link(entity, text = entity.title_for_page)
    link_to(text, diary_entry_path(date: entity.date.strftime('%F')))
  end
end

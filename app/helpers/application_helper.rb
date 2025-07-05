# frozen_string_literal: true

# Common helpers
module ApplicationHelper

  # @param [String|ApplicationRecord] path
  # @param [String] title
  # @param [Hash] options
  def world_icon(path, title = t(:view_as_visitor), options = {})
    if path.is_a? ApplicationRecord
      table_name = path.class.table_name
      path = path.respond_to?(:world_url) ? path.world_url : "/#{table_name}/#{path.id}"
    end
    icon_with_link('biovision/icons/world.svg', path, title, options)
  end

  # @param [String|ApplicationRecord] path
  # @param [String] title
  # @param [Hash] options
  def gear_icon(path, title = t(:view_settings), options = {})
    path = "/#{path.class.table_name}/#{path.id}" if path.is_a? ApplicationRecord
    icon_with_link('icons/gear.svg', path, title, options)
  end

  # @param [String] path
  # @param [String] title
  # @param [Hash] options
  def create_icon(path, title = t(:create), options = {})
    icon_with_link('icons/create.svg', path, title, options)
  end

  # @param [String|ApplicationRecord] path
  # @param [String] title
  # @param [Hash] options
  def edit_icon(path, title = t(:edit), options = {})
    path = "/#{path.class.table_name}/#{path.id}/edit" if path.is_a? ApplicationRecord
    icon_with_link('icons/edit.svg', path, title, options)
  end

  # @param [String|ApplicationRecord] path
  # @param [String] title
  # @param [Hash] options
  def icon_with_link(source, path, title, options = {})
    link_to(image_tag(source, alt: title), path, options)
  end
end

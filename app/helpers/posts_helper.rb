# frozen_string_literal: true

module PostsHelper
  # @param [Post] entity
  def post_link(entity, text = entity.title)
    link_to(text, post_path(id: entity.id))
  end

  def post_image_placeholder
    image_tag(asset_url('posts/placeholder.svg'))
  end

  # Small (320x320) version of post image
  #
  # @param [Post] entity
  # @param [Hash] options
  def post_image_small(entity, options = {})
    return post_image_placeholder unless entity.image.attached?

    image = entity.image
    default = {
      alt: '',
      load: 'lazy'
    }
    default[:srcset] = "#{rails_representation_url(image.variant(:medium))} 2x"

    image_tag(image.variant(:small), default.merge(options))
  end

  # Medium (640x640) version of post image
  #
  # @param [Post] entity
  # @param [Hash] options
  def post_image_medium(entity, options = {})
    return post_image_placeholder unless entity.image.attached?

    image = entity.image
    default = {
      alt: '',
      load: 'lazy'
    }
    default[:srcset] = "#{rails_representation_url(image.variant(:large))} 2x"

    image_tag(image.variant(:medium), default.merge(options))
  end

  # Large (1280x1280) version of post image
  #
  # @param [Post] entity
  # @param [Hash] options
  def post_image_large(entity, options = {})
    return post_image_placeholder unless entity.image.attached?

    image = entity.image
    default = {
      alt: '',
      load: 'lazy'
    }
    default[:srcset] = "#{rails_representation_url(image.variant(:hd))} 2x"

    image_tag(image.variant(:large), default.merge(options))
  end

  # HD (1920x1920) version of post image
  #
  # @param [Post] entity
  # @param [Hash] options
  def post_image_hd(entity, options = {})
    return post_image_placeholder unless entity.image.attached?

    default = {
      alt: '',
      load: 'lazy'
    }

    image_tag(entity.image.variant(:hd), default.merge(options))
  end
end

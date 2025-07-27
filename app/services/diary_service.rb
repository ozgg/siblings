# frozen_string_literal: true

# Serving diary-related stuff
class DiaryService
  # Get list of posts with pagination
  #
  # @param [Integer] page
  # @return [Hash]
  def self.list(page = 1)
    dates = Kaminari.paginate_array(Post.distinct.order(date: :desc).pluck(:date)).page(page).per(14)
    posts = {}
    Post.ordered.where(date: dates).each do |post|
      posts[post.date] = [] unless posts.key?(post.date)
      posts[post.date] << post
    end

    { dates:, posts: }
  end

  # Adjacent dates for entry
  #
  # @param [Date] current
  def self.adjacent_dates(current)
    {
      prev: Post.order(date: :desc).where(date: ...current).maximum(:date),
      next: Post.order(date: :asc).where('date > ?', current).minimum(:date)
    }
  end
end

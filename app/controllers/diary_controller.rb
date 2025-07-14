# frozen_string_literal: true

# Public diary controller
class DiaryController < ApplicationController
  allow_unauthenticated_access

  # get /diary
  def index
    @collection = Post.list(current_page)
  end

  # get /diary/:date
  def show
    @collection = Post.where(date: params[:date]).list
  end
end

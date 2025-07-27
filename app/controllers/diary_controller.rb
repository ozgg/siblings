# frozen_string_literal: true

# Public diary controller
class DiaryController < ApplicationController
  allow_unauthenticated_access

  # get /diary
  def index
    @collection = DiaryService.list(current_page)
  end

  # get /diary/:date
  def show
    @date = Date.parse(params[:date])
    @collection = Post.where(date: @date).list
  end
end

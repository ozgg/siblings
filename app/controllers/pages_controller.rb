# frozen_string_literal: true

class PagesController < ApplicationController
  # get /
  def home
    @siblings = Sibling.order(:birthday)
  end
end

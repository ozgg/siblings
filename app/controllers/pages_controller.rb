# frozen_string_literal: true

class PagesController < ApplicationController
  allow_unauthenticated_access

  # get /
  def home
    @siblings = Sibling.order(:birthday)
  end
end

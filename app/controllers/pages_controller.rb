class PagesController < ApplicationController
  # @route GET / (root)
  def home
    authorize User
  end
end

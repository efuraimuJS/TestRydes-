class PagesController < ApplicationController
  # @route GET / (root)
  def home
    authorize User
  end

  # @route GET /instructors (instructors)
  def instructors
    @instructors = User.instructors
  end
end

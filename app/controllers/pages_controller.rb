class PagesController < ApplicationController
  # @route GET / (root)
  def home
    authorize User
  end

  def instructors
    @instructors = User.instructors
  end
end

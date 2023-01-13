class PagesController < ApplicationController
  # @route GET / (root)
  def home
    authorize User
  end

  # @route GET /find_instructors (find_instructors)
  def instructors
    @instructors = User.instructors
  end

  # @route POST /find_instructors (find_instructors)
  def instructor_search

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append('instr_search_results', params[:query])
      end
    end
  end
end

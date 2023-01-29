class PagesController < ApplicationController
  # @route GET / (root)
  def home
    authorize User
  end

  # @route GET /find_instructors (find_instructors)
  def instructors
    @results = Instructor.filter_by_instructor_vehicle(params[:query])
  end

  # @route POST /find_instructors (find_instructors)
  def instructor_search
    if params[:query].nil? || params[:query].empty?
      @results = Instructor.filter_by_instructor_vehicle("*")
    else
      @results = Instructor.filter_by_instructor_vehicle(params[:query])
    end
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update('instr_search_results',
                                                 partial: "layouts/instr_search_results",
                                                 locals: {results: @results})
      end
    end
  end
end

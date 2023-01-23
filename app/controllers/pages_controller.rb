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
    @results = Instructor.search("#{params[:query]}").response.hits.hits.map{|r| r._source}
    if params[:query].empty?
      @results = Instructor.search("*").response.hits.hits.map{|r| r._source}
    else
      @results = Instructor.search("#{params[:query]}").response.hits.hits.map{|r| r._source}
    end
    respond_to do |format|
      format.turbo_stream do
        # render turbo_stream: turbo_stream.update('instr_search_results', @query&.results&.first&._source&.email)
        render turbo_stream: turbo_stream.update('instr_search_results',
                                                 partial: "layouts/instr_search_results",
                                                 locals: {results: @results})
      end
    end
  end
end

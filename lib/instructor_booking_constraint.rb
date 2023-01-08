class InstructorBookingConstraint
  # require_relative File.expand_path('../app/models/user')
  # def initialize
  #   super
  #   instructor_valid = []
  #   User.instructors.deep_pluck(:id).each do |hash|
  #     hash.each do |k, v|
  #       instructor_valid << v
  #     end
  #   end
  #   instructor_valid
  # end

  def matches? (request)
    passed_user_id = request.fullpath.split('/')[2].to_i
    Instructor.where(:id => passed_user_id).exists?
  end
end
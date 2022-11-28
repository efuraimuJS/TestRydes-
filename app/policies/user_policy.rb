class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def home?
    # @user.has_any_role? :freeuser, :admin
    true
  end
end

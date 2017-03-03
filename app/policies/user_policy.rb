class UserPolicy < ApplicationPolicy

  def create?
    user.roles?(:admin) && user.logged_in?
  end
end

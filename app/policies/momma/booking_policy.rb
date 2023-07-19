class Momma::BookingPolicy < ApplicationPolicy
  def index?
    user.momma?
  end

  def edit?
    user.momma? && record.user == user
  end

  def update?
    user.momma? && record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.where(user: user)
    end
  end
end

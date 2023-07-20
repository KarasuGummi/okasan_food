class ListingPolicy < ApplicationPolicy
  def new?
    user.momma?
    # for testing purposes change to true
  end

  def create?
    user.momma?
    # for testing purposes change to true
  end

  def destroy?
    user.momma && record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end

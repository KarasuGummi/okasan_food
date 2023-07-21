class ListingPolicy < ApplicationPolicy
  def new?
    true
    # user.momma?
    # for testing purposes change to true
  end

  def create?
    true
    # user.momma?
    # for testing purposes change to true
  end

  def destroy?
    user.momma && record.user == user
  end

  def show?
    true
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end

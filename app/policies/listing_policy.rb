class ListingPolicy < ApplicationPolicy
  def new?
    user.momma?
  end

  def create?
    user.momma?
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

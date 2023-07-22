class BookingPolicy < ApplicationPolicy

  def show?
    user == booking.user
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
   user == booking.user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.bookings.includes(:listing)

    end
  end
end


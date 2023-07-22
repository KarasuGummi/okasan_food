class BookingPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    user.present? && user == booking.user
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && user == booking.user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.bookings.includes(:listing)
    end
  end
end


# 

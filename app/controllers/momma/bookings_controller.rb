class Momma::BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:edit, :update]

  def index
    @bookings = current_user.bookings
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking

    if @booking.update(booking_params)
      redirect_to momma_bookings_path, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date_time, :status, :listing_id, :user_id)
  end
end

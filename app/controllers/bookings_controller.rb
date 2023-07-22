class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = policy_scope(Booking).includes(:listing)
  end

  def show
    @booking = Booking.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    # @listing = Listing.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      redirect_to booking_path(@bookings), notice: "Booking was successfully created!"
    else
      render 'listings/show'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path, status: :see_other, notice: "Bookmark was succesfully deleted."
  end

  private

  def booking_params
    params.require(:booking).permit(:date_time, :status)
  end
end

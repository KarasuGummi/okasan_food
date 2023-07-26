class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = policy_scope(Booking).includes(:listing)
    @total_price = calculate_total_booking_price(@bookings)
  end

  def show
    @booking = Booking.find(params[:id])
    @listing = Listing.find(params[:listing_id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @listing = Listing.find(params[:listing_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path, notice: "Booking was successfully created!"
    else
      render 'listings/show'
    end
    authorize @booking
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

  def calculate_total_booking_price(bookings)
    total_price = bookings.sum { |booking| booking.listing.price }
    return total_price
  end
end

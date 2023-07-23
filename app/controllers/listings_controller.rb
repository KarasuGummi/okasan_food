class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end


  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to momma_bookings_path
    else
      puts @listing.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    authorize @listing
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :category, :price, :photo)
  end
end

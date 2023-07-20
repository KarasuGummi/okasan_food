class ListingsController < ApplicationController
  skip_authorization only: %i[index show]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @listing = Listing.new(listing_params)
    authorize @listing
    if @listing.save
      redirect_to listing_path(@listing)
    else
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
    params.require(:listing).permit(:name, :category, :price)
  end
end

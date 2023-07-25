class Momma::ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:edit, :update]

  def index
    @listings = policy_scope([:momma, Listing])
  end

  def edit
    authorize([:momma, @listing])
  end

  def update
    @listing = current_user.listings.find(params[:id])
    authorize([:momma, @listing])

    if @listing.update(listing_params)
      redirect_to momma_listingss_path, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_listing
    @listing = current_user.listings.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :category, :price, :photo)
  end
end

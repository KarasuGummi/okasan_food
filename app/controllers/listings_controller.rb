class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @listings = Listing.search_by_name_and_category(params[:query])
    else
      @listings = Listing.all
    end
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
    reviews_count = @listing.reviews.count
    @average = reviews_count > 0 ? @listing.reviews.map { |review| review.rating }.sum / reviews_count : 0
    # @average = @listing.reviews.map { |review| review.rating }.sum / @listing.reviews.count
    authorize @listing
  end


  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to momma_listings_path
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
    params.require(:listing).permit(:name, :category, :price, :description, :photo)
  end
end

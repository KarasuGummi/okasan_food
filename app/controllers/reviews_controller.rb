class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @review = @listing.reviews.new(review_params)
    @review.user = current_user

    authorize @review
    
    if @review.save
    #   redirect_to new_review_path
    # else
      # flash[:alert] = "Something went wrong."
      # render :new
      flash[:notice] = "Review created successfully!"
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

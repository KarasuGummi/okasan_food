class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
    #   redirect_to new_review_path
    # else
      # flash[:alert] = "Something went wrong."
      # render :new
      flash[:notice] = "Review created successfully!"
      redirect_to listing_path(@review.listing)  # Replace "listing" with the appropriate resource name
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

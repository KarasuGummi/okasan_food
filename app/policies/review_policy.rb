class ReviewPolicy < ApplicationPolicy
  def create?
    # Add your authorization logic here.
    # For example, you may want to allow any user to create a review.
    # Replace the true with your specific authorization logic.
    true
  
  end
end

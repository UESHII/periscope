class ReviewsController < ApplicationController
  
  def create 
    @review = Review.create(review_params)
    redirect_to "/evaluations/#{@review.evaluation.id}"
  end

  private

  def review_params
    params.require(:review).permit(:clear, :dark).merge(user_id: current_user.id, evaluation_id: params[:evaluation_id])
  end
end

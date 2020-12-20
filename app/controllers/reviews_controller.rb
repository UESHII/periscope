class ReviewsController < ApplicationController

  def create 
    @review = Review.create(review_params)
    if @review.save
      redirect_to "/evaluations/#{@review.evaluation.id}"
    else
      redirect_to "/evaluations/#{@review.evaluation.id}", flash: { error: @review.errors.full_messages }
    end
  end

  private

  def review_params
    params.require(:review).permit(:clear, :dark).merge(user_id: current_user.id, evaluation_id: params[:evaluation_id])
  end
end
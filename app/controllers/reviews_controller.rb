class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create 
    @review = Review.new(review_params)
    if @review.save
      redirect_to "/evaluations/#{review.evaluation.id}"
    else
      render action: :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:goal, :dark).merge(user_id: current_user.id, evaluation_id: params[:evaluation_id])
  end
end

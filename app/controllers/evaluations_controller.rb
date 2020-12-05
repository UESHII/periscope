class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new
  before_action :set_evaluation, only: [:edit, :update, :show, :destroy]
  before_action :edit_restriction, only: [:edit, :update]

  def index
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @review = Review.new
    @reviews = @evaluation.reviews.includes(:user)
  end

  private

  def move_to_new
    unless current_user.profile
      redirect_to "/profiles/new"
    end
  end

  def evaluation_params
    params.require(:evaluation).permit(:goal, :result, :fiscal_year).merge(user_id: current_user.id)
  end

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def edit_restriction
    unless current_user.id == @evaluation.user.id
      redirect_to root_path
    end
  end

end
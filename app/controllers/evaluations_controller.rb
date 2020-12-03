class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def show
    @evaluation = Evaluation.find(params[:id])
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
end
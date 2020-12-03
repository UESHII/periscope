class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new
  before_action :set_evaluation, only: [:edit, :update, :show, :destroy]

  def index
    @evaluations = Evaluation.all.order("created_at DESC")
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
  end

  def destroy
    @evaluation.destroy
    redirect_to root_path, notice: '削除しました'
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
end
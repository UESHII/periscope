class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new, only: [:edit, :show, :index]
  before_action :set_profile, only: [:edit, :show, :update, :destroy]
  before_action :edit_restriction, only: [:edit, :update]

  def index
    @evaluations = Evaluation.includes(:user).order("created_at DESC")
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def show
    @evaluations = Evaluation.where(user_id: @profile.user.id).order("fiscal_year DESC")
  end

  def update
    if @profile.update(profile_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:contact, :team_id).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def move_to_new
    unless current_user.profile
      redirect_to action: :new
    end
  end

  def edit_restriction
    unless current_user.id == @profile.user.id
      redirect_to root_path
    end
  end
end

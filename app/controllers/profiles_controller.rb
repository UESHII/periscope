class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new, only: [:edit, :show, :update, :index]
  before_action :set_profile, only: [:edit, :show, :update]

  def index
    @profiles = Profile.all
    @evaluations = Evaluation.all.order("created_at DESC")
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
    @evaluation = Evaluation.find(params[:id])
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
end

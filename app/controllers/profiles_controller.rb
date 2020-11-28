class ProfilesController < ApplicationController
  def index
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to action: :new
    else
      render :new
    end
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:contact, :team_id).merge(user_id: current_user.id)
  end
end

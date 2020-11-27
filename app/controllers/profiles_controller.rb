class ProfilesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @profile = Profile.new(profile_params)
  end

  def edit
  end

  private

  def profile_params
    params.require(:profile).permit(:contact, :team_id).merge(user_id: current_user.id)
  end
end

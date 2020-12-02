class ExploresController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new

  def index
    @users = User.all
    @profiles = Profile.all
  end

  private

  def move_to_new
    unless current_user.profile
      redirect_to "/profiles/new"
    end
  end
end
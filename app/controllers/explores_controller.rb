class ExploresController < ApplicationController
  def index
    @users = User.all
    @profiles = Profile.all
  end
end

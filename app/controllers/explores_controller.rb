class ExploresController < ApplicationController
  def index
    @user = User.all
    @profile = Profile.all
  end
end

class ExploresController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_new

  def index
    @users = User.all
    @profiles = Profile.all
    @teams = Team.all
    @u = User.ransack(params[:q])  # 検索オブジェクトを生成
  end

  def search
    @u = User.search(search_params)  #Userモデルをserch_paramsで検索
    @results = @u.result(distinct: true)  #結果を変数に定義、distinct: trueで重複を回避
  end

  private

  def move_to_new
    unless current_user.profile
      redirect_to "/profiles/new"
    end
  end

  def search_params
    params.require(:q).permit!
  end
end
class TenkensController < ApplicationController
  def index
    @tenken = Tenken.new
    @tenkens = Tenken.includes(:user).order('created_at DESC')
  end

  def create
    @tenken = Tenken.new(tenken_params)
    if @tenken.save
    redirect_to root_path
    end
  end

  private
  def tenken_params
    params.require(:tenken).permit(:name).merge(user_id: current_user.id)
  end
end

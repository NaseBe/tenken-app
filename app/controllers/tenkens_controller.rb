class TenkensController < ApplicationController
  before_action :set_tenken, only: [:show, :edit, :update]
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

  def show
  end

  def edit
  end

  def update
    if @tenken.update(tenken_params)
      redirect_to tenken_path(@tenken.id)
    else
      redirect_to action: :edit
    end
  end

  private

  def tenken_params
    params.require(:tenken).permit(:name).merge(user_id: current_user.id)
  end

  def set_tenken
    @tenken = Tenken.find(params[:id])
  end
end

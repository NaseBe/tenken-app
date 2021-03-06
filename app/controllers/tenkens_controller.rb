class TenkensController < ApplicationController
  before_action :set_tenken, only: [:show, :edit, :update, :destroy]
  def index
    @tenken = Tenken.new
    @tenkens = Tenken.includes(:user).order('created_at DESC')
  end

  def create
    Tenken.create(tenken_params)
    redirect_to root_path
  end

  def show
    @checksheets = @tenken.checksheets.order('classroom_id ASC')
    @classrooms = pending_classrooms(@checksheets)
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

  def destroy
    @tenken.destroy
    redirect_to root_path
  end

  private

  def tenken_params
    params.require(:tenken).permit(:name).merge(user_id: current_user.id)
  end

  def set_tenken
    @tenken = Tenken.find(params[:id])
  end

  def pending_classrooms(checksheets)
    done = []
    pending = []
    checksheets.each do |checksheet|
      done << checksheet[:classroom_id]
    end
    classrooms = Classroom.all
    classrooms.each do |classroom|
      pending << classroom unless done.include?(classroom[:id]) || classroom[:id] == 0
    end
    pending
  end
end

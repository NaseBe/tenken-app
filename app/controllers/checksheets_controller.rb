class ChecksheetsController < ApplicationController
  before_action :set_users
  before_action :set_tenken
  before_action :set_checksheet, only: [:show, :edit, :update, :destroy]

  def new
    @checksheet = @tenken.checksheets.new
  end

  def create
    @checksheet = @tenken.checksheets.new(checksheet_params)
    if @checksheet.save
      redirect_to tenken_path(@tenken.id)
    else
     render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @checksheet.comments.includes(:user)
  end

  def edit
  end

  def update
    if @checksheet.update(checksheet_params)
      redirect_to tenken_path(@tenken.id)
    else
      render :edit
    end
  end

  def destroy
    @checksheet.destroy
    redirect_to tenken_path(@tenken.id)
  end

  private

  def set_users
    @users = User.all
  end

  def set_tenken
    @tenken = Tenken.find(params[:tenken_id])
  end

  def set_checksheet
    @checksheet = @tenken.checksheets.find(params[:id])
  end

  def checksheet_params
    params.require(:checksheet).permit(:classroom_id, :projector, :control_panel, :mic, :pc, :bd_dvd_player, :remotes, :ohc, :screen, :ports, :cables, :expendables, :details, :staff, :helper, :date, :status, :image).merge(tenken_id: params[:tenken_id], user_id: current_user.id)
  end
end

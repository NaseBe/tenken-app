class ChecksheetsController < ApplicationController
  before_action :set_tenken

  def new
    @users = User.all
  end

  def create
    @checksheet = @tenken.checksheets.new(checksheet_params)
    if @checksheet.save
      redirect_to tenken_path(@tenken.id)
    end
  end

  def show
    @checksheet = @tenken.checksheets.find(params[:id])
  end

  private

  def set_tenken
    @tenken = Tenken.find(params[:tenken_id])
  end

  def checksheet_params
    params.permit(:classroom_id, :projector, :control_panel, :mic, :pc, :bd_dvd_player, :remotes, :ohc, :screen, :ports, :cables, :expendables, :details, :staff, :helper, :date, :status).merge(tenken_id: params[:tenken_id], user_id: current_user.id)
  end
end

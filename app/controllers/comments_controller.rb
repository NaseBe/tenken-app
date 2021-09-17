class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/tenkens/#{comment.checksheet.tenken.id}/checksheets/#{comment.checksheet.id}"
  end

  def destroy
    comment = Comment.find(params[:id])
    checksheet = comment.checksheet
    comment.destroy
    redirect_to "/tenkens/#{checksheet.tenken.id}/checksheets/#{checksheet.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, checksheet_id: params[:checksheet_id])
  end
end

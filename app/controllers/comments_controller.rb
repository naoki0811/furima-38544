class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user }
    end
  end

  def destroy
    comment =Comment.find_by(params[:item_id])
    comment.destroy
    redirect_to item_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

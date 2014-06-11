class CommentController < ApplicationController
  def create
  	@comment = Comment.new(params.require(:comment).permit(:text, :video_id))
  	@comment.user_id = current_user.id
  	@comment.save
  	redirect_to video_path(@comment.video_id)
  	#redirect_to root_path
  end
end

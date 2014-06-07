class CommentsController < ApplicationController
  def create
  	@comment = Comment.new(params.require(:comment).permit(:text, :film_id))
  	@comment.user_id = current_user.id
  	@comment.save
  	#redirect_to film_path(@comment[:film_id])
  	redirect_to films_path(@film)
  end
end

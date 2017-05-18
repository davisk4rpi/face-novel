class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_back(fallback_location: root_url)
    else
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    @comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_back(fallback_location: root_url)
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end

end

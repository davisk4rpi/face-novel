class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(post_id: params[:post_id])
    if @like.save
      redirect_back(fallback_location: root_url)
    else
      redirect_back
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    flash[:success] = "Micropost deleted"
    redirect_back(fallback_location: root_url)
  end

end

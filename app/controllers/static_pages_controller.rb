class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post  = current_user.posts.build
      friends = current_user.friends
      f_ids = friends.map { |f| f.id }
      f_ids << current_user.id
      @posts = Post.where(user_id: f_ids).order(created_at: :desc)
    end
  end

  def about
  end
end

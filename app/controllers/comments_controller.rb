class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @comment = Comment.create!(post_id: params[:post_id], user_id: params[:user_id], body: params[:body])
    redirect_to(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentid = @comment.id
    @comment.destroy!
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def toggle_like_comment
    @comment = Comment.find(params[:comment_id])
    session[:comment_likes] ||= []
    if session[:comment_likes].include?(@comment.id) || current_user.liked?(@comment)
      @comment.unliked_by! current_user
      session[:comment_likes].delete(@comment.id)
    else
      @comment.liked_by! current_user
      session[:comment_likes].append(@comment.id)
    end
    @likecount = @comment.like_count
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end

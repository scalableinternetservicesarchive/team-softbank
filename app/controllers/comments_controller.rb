class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_id: params[:post_id], user_id: params[:user_id], body: params[:body])
    flash[:notice] = if @comment.save
                       'Comment was successfully created.'
                     else
                       "Error creating comment: #{@comment.errors}"
                     end
    redirect_to(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    post_path = '/posts/' + @comment.post_id
    @comment.destroy
    redirect_to(post_path)
  end

  def toggle_like_comment
    @comment = Comment.find(params[:comment_id])
    if current_user.liked? @comment
      @comment.unliked_by current_user
    else
      @comment.liked_by current_user
    end
    redirect_to("/posts/#{@comment.post_id}")
  end
end

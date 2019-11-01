class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(post_id: params[:post_id], user_id: params[:user_id], body: params[:body])
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@post)
    else
      flash[:notice] = "Error creating comment: #{@comment.errors}"
      redirect_to(@post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post_path = '/posts/' + @comment.post_id
    @comment.destroy
    redirect_to(post_path)
  end
end

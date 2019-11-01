class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id)
  end

  def create
    @user = User.find_by_email(params[current_user.email])
    @post = Post.new(post_params) # TODO: author, location
    @post.likes = 0
    @post.user_id = current_user.id
    @post.save!

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to '/posts/'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

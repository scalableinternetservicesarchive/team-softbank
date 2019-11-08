class PostsController < ApplicationController
  # before_action :check_logged_in, only: [:create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create
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

  def toggle_like_post
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    if @user.voted_for? @post
      @post.unliked_by @user
    else
      @post.liked_by @user
    end
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def check_logged_in
    redirect_to '/' unless user_signed_in?
  end
end

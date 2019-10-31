class PostsController < ApplicationController
  before_action :find_user, only: [:create]
  before_action :find_post, only: [:destroy]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.post.new(post_params) # TODO: author, location
    @post.author = current_user.email
    @post.save!

    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to '/posts/'
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
  def find_user
    @user = User.find_by_email(params[current_user.email])
   end
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

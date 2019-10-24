class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params) # TODO: author, location
    @post.likes = 0
    @post.author = 'garbo'
    @post.save!

    redirect_to @post
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
  private :post_params
end

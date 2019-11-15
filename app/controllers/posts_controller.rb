class PostsController < ApplicationController
  # before_action :check_logged_in, only: [:create]
  geocode_ip_address
  before_action :location, only: [:index, :new, :create]

  def index
    # @posts = Post.all
    @posts = Post.within(
      5, # TODO: param
      units: :miles,
      origin: @location
    ).by_distance(origin: @location)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params) # TODO: author?
    @post.likes = 0
    @post.user_id = current_user.id
    @post.latitude, @post.longitude = @location
    puts @location.inspect
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
    if current_user.liked? @post
      @post.unliked_by current_user
    else
      @post.liked_by current_user
    end
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def location
    @location = session[:geo_location].slice('lat', 'lng').values
    @location ||= [0, 0] # TODO: something better
  end

  def check_logged_in
    redirect_to '/' unless user_signed_in?
  end
end

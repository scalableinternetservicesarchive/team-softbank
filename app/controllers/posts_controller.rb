class PostsController < ApplicationController
  # before_action :check_logged_in, only: [:create]
  # geocode_ip_address
  before_action :set_location, only: [:index, :show]
  respond_to :html, :js

  def index
    @posts = Post.within_location(@location).by_distance(origin: @location)
  end

  def show
    # TODO: check user loc
    @post = Post.find(params[:id])

    # if @post.publicly_viewable? || @posts.include?(@post)
    #   puts "does this work"
    # end

    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params) # TODO: author?
    @post.likes = 0
    @post.user_id = current_user.id

    if post_params[:latitude] == 'error'
      # TODO: remove ip geocoding altogether
      # or find a way to use it as fallback
      # esp cause we might need to fallback for load testing
      @post.latitude, @post.longitude = @location
    else
      # TODO: check if present
      # and store in session and cookie
      # this we can hold off until we scale
    end

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

  def update_location
    # TODO: check if session is identical
    # TODO: add a cookie and a check jquery-side for scaling
    session[:html5_geoloc] = [params[:latitude], params[:longitude]]
    @location = session[:html5_geoloc]
    @posts = Post.within_location(@location).by_distance(origin: @location)
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :latitude, :longitude, :image)
  end

  def set_location
    @location = session[:html5_geoloc]
    @location ||= [0, 0] # TODO: something better
  end

  def check_logged_in
    redirect_to '/' unless user_signed_in?
  end
end

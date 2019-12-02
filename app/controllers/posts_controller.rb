class PostsController < ApplicationController
  # before_action :check_logged_in, only: [:create]
  before_action :location, only: [:index, :show]
  respond_to :html, :js
  POSTS_PER_PAGE = 25 # tried 50 and it's way too long imo
  COMMENTS_PER_PAGE = 50

  def index
    visible_posts = Post.within_location(@location)
    @sort = params[:sort]
    @posts_page = (params[:posts_page] || 1).to_i
    @posts_page_max = (visible_posts.size + (POSTS_PER_PAGE - 1)) / POSTS_PER_PAGE
    @posts = case @sort
             when 'spiciest'
              visible_posts.order('like_count DESC').limit(POSTS_PER_PAGE).offset((@posts_page - 1) * POSTS_PER_PAGE)
             when 'freshest'
              visible_posts.order('created_at DESC').limit(POSTS_PER_PAGE).offset((@posts_page - 1) * POSTS_PER_PAGE)
             else
              visible_posts.by_distance(origin: @location).limit(POSTS_PER_PAGE).offset((@posts_page - 1) * POSTS_PER_PAGE)
             end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments_page = (params[:comments_page] || 1).to_i
    @comments_page_max = (@post&.comments&.size + (COMMENTS_PER_PAGE - 1)) / COMMENTS_PER_PAGE
    @comments = @post&.comments&.order('like_count DESC').limit(COMMENTS_PER_PAGE).offset((@comments_page - 1) * COMMENTS_PER_PAGE)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    # NOTE: we assume lat/long are always present due to the stub!
    # TODO: store in session and cookie
    # this we can hold off until we scale

    @post.save!

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to '/posts/'
  end

  def toggle_like_post
    @post = Post.find(params[:post_id])
    @comments_page = (params[:comments_page] || 1).to_i
    if current_user.liked? @post
      @post.unliked_by! current_user
    else
      @post.liked_by! current_user
    end
    redirect_to post_path(id: @post.id, comments_page: @comments_page)
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

  def location
    @location = session[:html5_geoloc]
    @location ||= [0, 0] # TODO: something better
  end

  def check_logged_in
    redirect_to '/' unless user_signed_in?
  end
end

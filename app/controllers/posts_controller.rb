class PostsController < ApplicationController
  # before_action :check_logged_in, only: [:create]
  before_action :location, only: [:index, :show]
  respond_to :html, :js
  PAGE_LIMIT = 25

  def index
    visible_posts = Post.within_location(@location)
    @posts_page_num_max = (visible_posts.size + (PAGE_LIMIT - 1)) / PAGE_LIMIT
    @posts_page_num = [1, [params[:posts_page_num].to_i, @posts_page_num_max].min].max
    @sort = params[:sort]
    @posts = (case @sort
              when 'spiciest'
                visible_posts.order('like_count DESC')
              when 'freshest'
                visible_posts.order('created_at DESC')
              else
                visible_posts.by_distance(origin: @location)
              end).paginate(PAGE_LIMIT, @posts_page_num)
    fresh_when([@posts.all, @posts.sum(&:like_count), @posts.sum { |p| p.comments.size }, @posts.map { |p| helpers.distance_of_time_in_words(p.created_at, Time.now) }, @location])
  end

  def new
    fresh_when(current_user)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comments_page_num_max = (@post&.comments&.size.to_i + (PAGE_LIMIT - 1)) / PAGE_LIMIT
    @comments_page_num = [1, [params[:comments_page_num].to_i, @comments_page_num_max].min].max
    @comments = @post&.comments&.order('like_count DESC')&.paginate(PAGE_LIMIT, @comments_page_num)
    fresh_when([@post, @post.like_count, helpers.distance_of_time_in_words(@post.created_at, Time.now), @comments.all, @comments.sum(&:like_count), @location])
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
    @comments_page_num = (params[:comments_page_num] || 1).to_i
    if current_user.liked? @post
      @post.unliked_by! current_user
    else
      @post.liked_by! current_user
    end
    redirect_to @comments_page_num == 1 ? post_path(id: @post.id) : post_path(id: @post.id, comments_page_num: @comments_page_num)
  end

  def update_location
    # TODO: check if session is identical
    # TODO: add a cookie and a check jquery-side for scaling
    session[:html5_geoloc] = [params[:latitude], params[:longitude]].map { |p| p.to_d.round(6).to_s }
    @location = session[:html5_geoloc]
    @posts = Post.within_location(@location).by_distance(origin: @location)
    if stale?(@posts.all)
      respond_to do |format|
        format.js { render layout: false }
      end
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

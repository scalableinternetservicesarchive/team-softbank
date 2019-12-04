class ProfilesController < ApplicationController
  before_action :location

  def profile
    return redirect_to '/users/sign_in' unless user_signed_in?

    @user = current_user
    @posts = @user.posts
    @comments = @user.comments
    @total_received_spice = @posts.sum { |p| p.likes.count } + @comments.sum { |c| c.likes.count }
    fresh_when([@user.likes.count, @posts.all, @posts.sum(&:like_count), @posts.map { |p| helpers.distance_of_time_in_words(p.created_at, Time.now) }, @comments.all, @comments.sum(&:like_count), @comments.map { |c| helpers.distance_of_time_in_words(c.created_at, Time.now) }])
  end

  private

  def location
    @location = session[:html5_geoloc]
    @location ||= [0, 0] # TODO: something better
  end
end

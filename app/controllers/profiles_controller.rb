class ProfilesController < ApplicationController
  before_action :location

  def profile
    return redirect_to '/users/sign_in' unless user_signed_in?

    @user = current_user
    @posts = current_user.posts
    @comments = current_user.comments
    @total_received_spice = @posts.sum { |p| p.likes.count } + @comments.sum { |c| c.likes.count }
  end

  private

  def location
    @location = session[:html5_geoloc]
    @location ||= [0, 0] # TODO: something better
  end
end

class ProfilesController < ApplicationController
  before_action :location

  def profile
    redirect_to '/users/sign_in' unless user_signed_in?

    @user = User.includes(posts: { image_attachment: :blob }).includes(:comments).order(:id).find(current_user.id)
    @posts = @user.posts
    @comments = @user.comments
  end

  private

  def location
    @location = session[:html5_geoloc]
    @location ||= [0, 0] # TODO: something better
  end
end

class ProfilesController < ApplicationController
  def profile
    redirect_to '/users/sign_in' unless user_signed_in?

    @user = User.includes(posts: { image_attachment: :blob }).includes(:comments).order(:id).find(current_user.id)
    @posts = @user.posts
    @comments = @user.comments
  end
end

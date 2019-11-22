class ProfilesController < ApplicationController
  def profile
    redirect_to '/users/sign_in' unless user_signed_in?
    @user = current_user
    @posts = current_user.posts
    @comments = current_user.comments
    @total_recieved_spice = @posts.sum { |p| p.votes_for.size } + @comments.sum { |c| c.votes_for.size }
  end
end

class ProfilesController < ApplicationController
  def profile
    redirect_to '/users/sign_in' unless user_signed_in?
    @user = current_user
    @posts = current_user.posts
    @comments = current_user.comments
    @total_recieved_spice = @posts.map { |p| p.votes_for.size }.reduce(:+)
    + @comments.map { |c| c.votes_for.size }.reduce(:+)
  end
end

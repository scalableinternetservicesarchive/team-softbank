class ProfilesController < ApplicationController
  def profile
    redirect_to '/users/sign_in' unless user_signed_in?
    @user = current_user
    @posts = current_user.posts
    @comments = current_user.comments
    @total_recieved_spice = @posts.to_a.inject(0){ |s, p| s + (p.votes_for.size) } + @comments.to_a.inject(0){ |s, c| s + (c.votes_for.size) }
  end
end

class ProfilesController < ApplicationController
  def profile
    return redirect_to '/users/sign_in' unless user_signed_in?

    @user = User.includes(posts: { image_attachment: :blob }).includes(:comments).order(:id).find(current_user.id)
    @posts = @user.posts
    @comments = @user.comments
    fresh_when([@user.likes_count, @posts.all, @posts.sum(&:like_count), @posts.map { |p| helpers.distance_of_time_in_words(p.created_at, Time.now) }, @comments.all, @comments.sum(&:like_count), @comments.map { |c| helpers.distance_of_time_in_words(c.created_at, Time.now) }])
  end
end

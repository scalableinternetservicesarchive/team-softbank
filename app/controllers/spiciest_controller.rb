class SpiciestController < ApplicationController
  PAGE_LIMIT = 25
  def spiciest
    # @posts = Post.spiciest if stale?([Post.spiciest])
    @spiciest_page_num_max = 2 # lol
    @spiciest_page_num = [1, [params[:spiciest_page_num].to_i, @spiciest_page_num_max].min].max
    @posts = Post.with_attached_image.spiciest.paginate(PAGE_LIMIT, @spiciest_page_num)
    fresh_when([@posts.all, @posts.sum(&:like_count), @posts.sum { |p| p.comments.size }, @posts.map { |p| helpers.distance_of_time_in_words(p.created_at, Time.now) }])
  end
end

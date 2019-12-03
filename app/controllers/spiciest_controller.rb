class SpiciestController < ApplicationController
  POSTS_PER_PAGE = 25
  def spiciest
    @spiciest_page = (params[:spiciest_page] || 1).to_i
    @spiciest_page_max = 4 # lol
    @posts = Post.spiciest.limit(POSTS_PER_PAGE).offset((@spiciest_page - 1) * POSTS_PER_PAGE)
  end
end

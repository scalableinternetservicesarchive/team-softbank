class SpiciestController < ApplicationController
  PAGE_LIMIT = 25
  def spiciest
    # @posts = Post.spiciest if stale?([Post.spiciest])
    @spiciest_page_num_max = 2 # lol
    @spiciest_page_num = [1, [params[:spiciest_page_num].to_i, @spiciest_page_num_max].min].max
    @posts = Post.spiciest.paginate(PAGE_LIMIT, @spiciest_page_num)
    fresh_when(strong_etag: [@spiciest_page_num, @posts])
  end
end

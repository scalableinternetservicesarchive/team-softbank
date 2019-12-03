class SpiciestController < ApplicationController
  POSTS_PER_PAGE = 25
  def spiciest
    @spiciest_page_num_max = 4 # lol
    @spiciest_page_num = (params[:spiciest_page_num] || 1).to_i
    @spiciest_page_num = [@spiciest_page_num, @spiciest_page_num_max].min
    @spiciest_page_num = [1, @spiciest_page_num].max
    @posts = Post.spiciest.paginate(POSTS_PER_PAGE, @spiciest_page_num)
  end
end

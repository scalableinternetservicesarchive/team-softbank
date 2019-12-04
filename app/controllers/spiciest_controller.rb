class SpiciestController < ApplicationController
  PAGE_LIMIT = 25
  def spiciest
    @spiciest_page_num_max = 2 # lol
    @spiciest_page_num = [1, [params[:spiciest_page_num].to_i, @spiciest_page_num_max].min].max
    @posts = Post.with_attached_image.spiciest.paginate(PAGE_LIMIT, @spiciest_page_num)
  end
end

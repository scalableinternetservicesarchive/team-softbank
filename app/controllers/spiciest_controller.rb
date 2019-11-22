class SpiciestController < ApplicationController
  def spiciest
    @posts = Post.spiciest
  end
end

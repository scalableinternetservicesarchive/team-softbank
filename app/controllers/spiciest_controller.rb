class SpiciestController < ApplicationController
  def spiciest
    @posts = Post.spiciest if stale?([Post.spiciest])
  end
end

module SpiciestHelper
  def cache_key_for_noloc_postcard(post)
    "postcard-noloc-#{post.id}-#{post.updated_at}-#{post.likes.count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments.count}"
  end
end

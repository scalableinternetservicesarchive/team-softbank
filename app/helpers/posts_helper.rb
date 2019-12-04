module PostsHelper
  def cache_key_for_postcard(post, distance)
    "postcard-#{post.id}-#{post.updated_at}-#{post.likes.count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments.count}-#{distance}"
  end

  def cache_key_for_noloc_postcard(post)
    "postcard-noloc-#{post.id}-#{post.updated_at}-#{post.likes.count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments.count}"
  end

  def cache_key_for_postcard_body(post)
    "postcard-body-#{post.id}-#{post.updated_at}-#{post.likes.count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments.count}"
  end

  def cache_key_for_post_body(post)
    "post-body-#{post.id}-#{post.updated_at}-#{post.likes.count}-#{distance_of_time_in_words(post.created_at, Time.now)}"
  end
end

module PostsHelper
  def cache_key_for_postcard_table(posts, location, page_num, sort)
    "postcard-table-page#{page_num}-sort#{sort}-#{posts.pluck(:updated_at).max}-#{distance_of_time_in_words(posts.pluck(:created_at).min, Time.now)}-#{location}"
  end

  def cache_key_for_postcard(post, location)
    "postcard-#{post.id}-#{post.updated_at}-#{post.like_count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments_count}-#{location}"
  end

  def cache_key_for_noloc_postcard(post)
    "postcard-noloc-#{post.id}-#{post.updated_at}-#{post.like_count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments_count}"
  end

  def cache_key_for_postcard_body(post)
    "postcard-body-#{post.id}-#{post.updated_at}-#{post.like_count}-#{distance_of_time_in_words(post.created_at, Time.now)}-#{post.comments_count}"
  end

  def cache_key_for_post_body(post)
    "post-body-#{post.id}-#{post.updated_at}-#{post.like_count}-#{distance_of_time_in_words(post.created_at, Time.now)}"
  end
end

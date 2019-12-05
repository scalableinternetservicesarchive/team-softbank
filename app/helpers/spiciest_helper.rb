module SpiciestHelper
  def cache_key_for_noloc_post_table(posts, page_num)
    "noloc-post-table-page#{page_num}-#{posts.pluck(:updated_at).max}-#{distance_of_time_in_words(posts.pluck(:created_at).min, Time.now)}"
  end
end

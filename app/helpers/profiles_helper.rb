module ProfilesHelper
  def cache_key_for_profile_post_table(posts)
    "profile-post-table-#{posts.maximum(:updated_at)}-#{distance_of_time_in_words(posts.minimum(:created_at), Time.now)}"
  end

  def cache_key_for_comment_card_table(comments)
    "comment-card-table-#{comments.maximum(:updated_at)}-#{distance_of_time_in_words(comments.minimum(:created_at), Time.now)}"
  end
end

module PostsHelper
  def cache_key_for_comment(comment, current_user)
    "comment-#{comment.id}-#{comment.updated_at}-#{comment.likes.count}-#{distance_of_time_in_words(comment.created_at, Time.now)}-#{current_user&.id}"
  end
end

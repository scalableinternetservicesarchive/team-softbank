module CommentHelper
  def cache_key_for_comment_body(comment)
    "comment-body-#{comment.id}-#{comment.updated_at}-#{comment.likes.count}-#{distance_of_time_in_words(comment.created_at, Time.now)}"
  end
end

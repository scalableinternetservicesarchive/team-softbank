module CommentsHelper
  def cache_key_for_comment_table(comments, page_num)
    "comment-table-page#{page_num}-#{comments.pluck(:updated_at).max}-#{distance_of_time_in_words(comments.pluck(:created_at).min, Time.now)}"
  end

  def cache_key_for_comment(comment, current_user_id)
    "comment-#{comment.id}-#{comment.updated_at}-#{comment.likes.count}-#{distance_of_time_in_words(comment.created_at, Time.now)}-#{current_user_id}"
  end

  def cache_key_for_comment_body(comment)
    "comment-body-#{comment.id}-#{comment.updated_at}-#{comment.likes.count}-#{distance_of_time_in_words(comment.created_at, Time.now)}"
  end
end

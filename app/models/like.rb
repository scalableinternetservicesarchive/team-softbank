# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_likes_on_post_id  (post_id)
#  index_likes_on_user_id  (user_id)
#

# https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2
class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end

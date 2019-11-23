# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  type       :integer          default("0"), not null
#  type_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_likes_on_type              (type)
#  index_likes_on_type_and_type_id  (type,type_id)
#  index_likes_on_user_id           (user_id)
#

class Like < ApplicationRecord
  enum type: [:post, :comment]

  belongs_to :post, -> { where('type = ?', Like.types(:post)) }, inverse_of: :likes
  belongs_to :comment, -> { where('type = ?', Like.types(:comment)) }, inverse_of: :likes
  belongs_to :user
end

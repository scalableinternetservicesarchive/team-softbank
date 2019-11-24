# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  like_type  :integer          default("0"), not null
#  type_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_likes_on_like_type              (like_type)
#  index_likes_on_like_type_and_type_id  (like_type,type_id)
#  index_likes_on_user_id                (user_id)
#

class Like < ApplicationRecord
  enum like_type: [:post, :comment]

  belongs_to :post, foreign_key: :type_id, inverse_of: :likes, optional: true
  belongs_to :comment, foreign_key: :type_id, inverse_of: :likes, optional: true
  belongs_to :user

  validates :post, presence: true, if: :post?
  validates :comment, presence: true, if: :comment?
end

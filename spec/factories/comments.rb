# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_count :integer          default("0")
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#

FactoryBot.define do
  factory :comment do
    sequence(:user_id) { |n| n }
    sequence(:post_id) { |n| n }
    body { "fakecommentbody" }
  end
end

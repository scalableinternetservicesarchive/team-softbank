# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  likes      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  user_id    :integer
#  latitude   :decimal(10, 6)
#  longitude  :decimal(10, 6)
#
# Indexes
#
#  index_posts_on_latitude_and_longitude  (latitude,longitude)
#

FactoryBot.define do
  factory :post do
    body { 'fakebody' }
    likes { 0 }
    location { ActiveRecord::Point.new(0, 0) }
    title { 'faketitle' }
    sequence(:user_id) { |n| n }
  end
end

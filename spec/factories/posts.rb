# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  body           :text
#  like_count     :integer          default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  title          :string
#  user_id        :integer
#  lonlat         :geography({:srid point, 4326
#
# Indexes
#
#  index_posts_on_lonlat   (lonlat)
#  index_posts_on_user_id  (user_id)
#

FactoryBot.define do
  factory :post do
    body { 'fakebody' }
    location { ActiveRecord::Point.new(0, 0) }
    title { 'faketitle' }
    sequence(:user_id) { |n| n }
  end
end

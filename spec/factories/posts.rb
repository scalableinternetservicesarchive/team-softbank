# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author     :string           not null
#  body       :text
#  likes      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  longitude  :decimal(10, 6)
#  latitude   :decimal(10, 6)
#
# Indexes
#
#  index_posts_on_author  (author)
#

FactoryBot.define do
  factory :post do
    sequence(:author) { |n| "user#{n}" }
    body { 'fakebody' }
    likes { 0 }
    location { ActiveRecord::Point.new(0, 0) }
  end
end

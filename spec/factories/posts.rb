# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  likes      :integer
#  location   :point
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  user_id    :integer
#

FactoryBot.define do
  factory :post do
    sequence(:author) { |n| "user#{n}" }
    body { 'fakebody' }
    likes { 0 }
    location { ActiveRecord::Point.new(0, 0) }
  end
end

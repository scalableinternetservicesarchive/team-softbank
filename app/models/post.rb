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
#  latitude       :decimal(10, 6)
#  longitude      :decimal(10, 6)
#  comments_count :integer
#
# Indexes
#
#  index_posts_on_latitude_and_longitude  (latitude,longitude)
#

class Post < ApplicationRecord
  include Likable
  acts_as_mappable default_units: :miles,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  belongs_to :user
  has_many :comments
  has_many :likes, -> { Like.post }, foreign_key: :type_id, inverse_of: :post, dependent: :destroy
  has_one_attached :image

  scope :spiciest, -> { order('like_count DESC').limit(50) }
  scope :within_location, ->(location) { within(5, units: :miles, origin: location) }
  scope :paginate, ->(per_page, page_num) { limit(per_page).offset((page_num - 1) * per_page) }

  def publicly_viewable?
    Post.spiciest.include?(self)
  end

  def within?(latlng)
    distance_to(latlng) < 5.0
  end
end

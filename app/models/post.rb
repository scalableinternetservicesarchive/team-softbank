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

class Post < ApplicationRecord
  acts_as_mappable default_units: :miles,
                   default_formula: :sphere,
                   distance_field_name: :distance,
                   lat_column_name: :latitude,
                   lng_column_name: :longitude

  acts_as_votable
  belongs_to :user
  has_many :comments
  has_one_attached :image

  scope :spiciest, -> { order('likes DESC').limit(50) }
  scope :within_location, ->(location) { within(5, units: :miles, origin: location) }

  def publicly_viewable?
    Post.spiciest.include?(self)
  end

  def within?(latlng)
    distance_to(latlng) < 5.0
  end
end

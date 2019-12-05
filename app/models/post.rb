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
#  comments_count :integer
#  lonlat         :geography({:srid point, 4326
#
# Indexes
#
#  index_posts_on_lonlat   (lonlat)
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  include Likable
  attribute :distance, :float
  attribute :distance_miles, :float

  belongs_to :user
  has_many :comments
  has_many :likes, -> { Like.post }, foreign_key: :type_id, inverse_of: :post, dependent: :destroy
  has_one_attached :image

  scope :spiciest, -> { order('like_count DESC').limit(50) }
  scope :within_location, -> (location) {
    where("ST_DWithin(lonlat, ST_MakePoint(?,?)::geography, 8000)", location.last, location.first) # 5 mi = 8.04672 km
      .select("\"posts\".*", "ST_Distance(lonlat, ST_MakePoint(#{location.last},#{location.first})::geography) AS distance")
  }
  scope :by_distance, -> { order("distance") }
  scope :paginate, ->(per_page, page_num) { limit(per_page).offset((page_num - 1) * per_page) }

  def publicly_viewable?
    Post.spiciest.include?(self)
  end

  def within?(location)
    Post.within_location(location).include?(self)
  end

  def distance_to
    (distance / 1609.34).round(2)
  end

  def distance_manual(location)
    distance = ActiveRecord::Base.connection.execute("SELECT ST_Distance(f.lonlat, ST_MakePoint(#{location.last},#{location.first})::geography) FROM (SELECT lonlat FROM posts WHERE id = #{id} LIMIT 1) AS f").first['st_distance']
    distance.present? ? (distance / 1609.34).round(2) : 0
  end
end

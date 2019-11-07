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

class Post < ApplicationRecord
    acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end

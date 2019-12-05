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

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

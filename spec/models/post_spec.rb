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

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

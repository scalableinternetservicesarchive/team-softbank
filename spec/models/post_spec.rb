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

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

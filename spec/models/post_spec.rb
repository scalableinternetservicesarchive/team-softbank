# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author     :string           not null
#  body       :text
#  location   :point
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_author   (author)
#  index_posts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

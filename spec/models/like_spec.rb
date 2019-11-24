# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  like_type  :integer          default("0"), not null
#  type_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_likes_on_like_type              (like_type)
#  index_likes_on_like_type_and_type_id  (like_type,type_id)
#  index_likes_on_user_id                (user_id)
#

require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

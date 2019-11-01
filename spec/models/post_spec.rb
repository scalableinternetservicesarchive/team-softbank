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

require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

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

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
end

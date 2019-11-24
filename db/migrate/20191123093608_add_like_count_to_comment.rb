class AddLikeCountToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :like_count, :integer, default: 0
  end
end

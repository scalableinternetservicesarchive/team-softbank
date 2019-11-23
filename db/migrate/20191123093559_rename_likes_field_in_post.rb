class RenameLikesFieldInPost < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :likes, :like_count
    change_column_default :posts, :like_count, 0
  end
end

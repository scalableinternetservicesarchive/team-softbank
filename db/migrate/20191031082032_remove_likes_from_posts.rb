class RemoveLikesFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :likes, :integer
  end
end

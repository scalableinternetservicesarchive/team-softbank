class RemoveAuthorFromPosts < ActiveRecord::Migration[6.0]
  def change

    remove_column :posts, :author, :string
  end
end

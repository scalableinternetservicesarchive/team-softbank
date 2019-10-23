class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :author, null: false
      t.text :body
      t.integer :likes, default: 0
      t.point :location

      t.timestamps
    end

    add_index :posts, :author
  end
end

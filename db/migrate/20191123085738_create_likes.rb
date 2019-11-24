class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :like_type, default: 0, null: false
      t.integer :type_id

      t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, :like_type
    add_index :likes, [:like_type, :type_id]
  end
end

class AddLatLongToPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :location

    add_column :posts, :latitude, :decimal, precision: 10, scale: 6
    add_column :posts, :longitude, :decimal, precision: 10, scale: 6

    add_index :posts, [:latitude, :longitude]
  end
end

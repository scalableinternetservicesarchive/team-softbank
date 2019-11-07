class AddLatLongToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :longitude, :decimal, precision: 10, scale: 6
    add_column :posts, :latitude, :decimal, precision: 10, scale: 6
    remove_column :posts, :location
  end
end

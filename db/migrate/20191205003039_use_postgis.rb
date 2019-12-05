class UsePostgis < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :latitude
    remove_column :posts, :longitude
    add_column :posts, :lonlat, :st_point, geographic: true
    add_index :posts, :lonlat, using: :gist
  end
end

class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name, presence: true, index: true
      t.integer :band_id, index: true
      
      t.timestamps
    end
  end
end

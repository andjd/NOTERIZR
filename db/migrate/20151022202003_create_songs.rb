class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_name, presence: true
      t.integer :album_id, presence: true, index: true

      t.timestamps
    end
  end
end

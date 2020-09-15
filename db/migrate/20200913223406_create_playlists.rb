class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :title
      t.string :date
      t.string :songs
      t.integer :ratings
      t.integer :school_id
      t.integer :song_id

      t.timestamps
    end
  end
end

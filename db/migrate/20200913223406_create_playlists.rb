class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :date
      t.string :songs
      t.integer :ratings

      t.timestamps
    end
  end
end

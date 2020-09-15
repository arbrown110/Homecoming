class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :tune
      t.integer :playlist_id
      t.integer :user_id

      t.timestamps
    end
  end
end


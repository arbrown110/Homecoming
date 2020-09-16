class RemovePlaylistIdFromSchools < ActiveRecord::Migration[6.0]
  def change
    remove_column :schools, :playlist_id, :integer
  end
end

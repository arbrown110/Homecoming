class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :playlist_id
      t.integer :user_id

      t.timestamps
    end
  end
end

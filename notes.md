Homecoming

Schools 
- belongs to :user
- has_many :playlist
- has_many :users, through :playlist
- belongs_to :songs
- name
- city
- state


User
- has_many :schools
- has_many :playlists
- has_many :jams, through :playlists
- has_many :songs, trough :schools
- username
- email
- password_digest
- user_id

Playlist ** join table users and schools
- belongs_to :user
- belongs_to :school
- title
- date
- songs
- ratings

Songs
- has_many :playlists
- has_many :users, through :posts
- artist
- title

Ratings
- 



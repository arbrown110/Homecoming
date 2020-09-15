class PlaylistsController < ApplicationController

before_action :redirect_if_not_signed_in

 def show
   @playlist = Playlist.find(params[:id])
 end

 def index
   @playlists = Playlist.all
 end

 def new
   @playlist = Playlist.new
   @playlist.songs.build(name: "First Song")
   @playlist.songs.build(name: "Second Song")
   @playlist.songs.build(name: "Third Song")
   @playlist.songs.build(name: "Fourth Song")
   @playlist.songs.build(name: "Fifth Song")
 end
  
 def create
   Playlist.create(playlist_params)
   redirect_to playlists_path
 end
  
 def playlist_params
  params.require(:playlist).permit(:title, :date, songs_attributes: [ :artist, :tune ], :ratings)
 end
end
class PlaylistsController < ApplicationController

before_action :redirect_if_not_signed_in

 def index
  if params[:school_id] && @school = School.find_by_id(params[:school_id])
    @playlists = @school.playlists
  else
   @playlists = Playlist.all
  end
 end

 def new
   @playlist = Playlist.new
   @playlist.songs.build(artist: "1", tune: "1")
   @playlist.songs.build(artist: "2", tune: "2")
   @playlist.songs.build(artist: "3", tune: "3")
   @playlist.songs.build(artist: "4", tune: "4")
   @playlist.songs.build(artist: "5", tune: "5")
 end
  
 def create
   @playlist = current_user.playlists.create(playlist_params)
   if @playlist.save
   redirect_to playlist_path(@playlist)
   else
    #@playlist.build_school unless @playlist.build_school
    render :new
   end
 end

 def show
   @playlist = Playlist.find(params[:id])
 end

 def edit
  @playlist = Playlist.find(params[:id])
 end

 def delete
  @playlist = Playlist.find(params[:id])
 end


 private

 def playlist_params
  params.require(:playlist).permit(:user_id, :title, :date, :ratings, songs_attributes: [ :artist, :tune ])
 end
end
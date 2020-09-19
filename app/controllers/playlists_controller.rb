require 'pry'

class PlaylistsController < ApplicationController

before_action :redirect_if_not_signed_in, :current_user


 def index
  if params[:school_id] && @school = School.find_by_id(params[:school_id])
    @playlists = @school.playlists.alpha
  else
    @error = "The School isn't created" if params[:school_id]
   @playlists = Playlist.alpha
  end
 end

 def new
  if params[:school_id] && @school = School.find_by_id(params[:school_id])
  #binding.pry
    @playlist = @school.playlists.build
  5.times {|i| @playlist.songs.build}
  else
    #binding.pry
   @playlist = Playlist.new
   5.times {|i| @playlist.songs.build}
  end
 end
  
 def create
   @playlist = current_user.playlists.build(playlist_params)
   @playlist.songs.each do |song|
    song.user = current_user
    @playlist.save
   end
   if @playlist.save
   redirect_to playlist_path(@playlist)
   else
    render :new
   end
 end

 def show
  collect_playlist
 end

 def edit
  collect_playlist
 end

 def update
#  binding.pry
   collect_playlist
  if  @playlist.update(playlist_params) && current_user.id == @playlist.user.id
    redirect_to playlist_path(@playlist)
  else 
    render :edit
  end
 end


 def destroy
  collect_playlist
  @playlist.destroy
  redirect_to playlists_path
 end


 private

 def collect_playlist
  @playlist = Playlist.find(params[:id])
    if !@playlist || @playlist.user != current_user
      flash[:message] = "This doesn't belong to you."
      redirect_to playlists_path 
    end
 end



 def playlist_params
  params.require(:playlist).permit(:user_id, :school_id, :title, :date, :ratings, songs_attributes: [ :id, :artist, :tune])
 end
end
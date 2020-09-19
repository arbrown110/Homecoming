require 'pry'

class PlaylistsController < ApplicationController

before_action :redirect_if_not_signed_in, :current_user, :stored_playlist, only:[:show, :edit, :update, :delete]


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
  #collect_playlist
 end

 def edit
  collect_playlist_alert
  
 end

 def update

 if @playlist.update(playlist_params)
  redirect_to playlist_path(@playlist)
  else
    render :edit
  end

 end


 def destroy
   @playlist = Playlist.find(params[:id])
  if @current_user.id == @playlist.user_id
   @playlist.destroy
   redirect_to playlists_path
  else
   flash[:message] = "Sorry, you did not create this"
   redirect_to '/playlists'
  end
 end


 private

 def collect_playlist_alert
    if !@playlist || @playlist.user != current_user
      flash[:message] = "This doesn't belong to you."
      redirect_to playlist_path 
    else
      render :edit
    end
 end

 def stored_playlist
  @playlist = Playlist.find_by(id: params[:id])
  redirect_to playlists_path if !@playlist
 end

 

 def playlist_params
  params.require(:playlist).permit(:user_id, :school_id, :title, :date, :events, songs_attributes: [ :id, :artist, :tune])
 end
end
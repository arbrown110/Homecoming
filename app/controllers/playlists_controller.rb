class PlaylistsController < ApplicationController

before_action :redirect_if_not_logged_in

 def new
 @playlist = Playlist.new
 end

 
end

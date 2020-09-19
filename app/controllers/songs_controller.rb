
class SongsController < ApplicationController
  before_action :redirect_if_not_logged_in, :current_user
  def show
     @song = Song.find_by_id(params[:id])

  end
end
class SchoolsController < ApplicationController

    before_action :redirect_if_not_signed_in

 def new
 @school = School.new
 end

 def index
  @schools = School.all 
 end

 def show
 end


end

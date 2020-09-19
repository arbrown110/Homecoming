require 'pry'

class SchoolsController < ApplicationController

    before_action :redirect_if_not_signed_in, :current_user
    

 def new
 @school = School.new
 end

 def index
  @schools = School.all 
 end

 def create
    @school = School.create(school_params)
#binding.pry    
    if @school.save   
    redirect_to schools_path(@school)
    else
    render :new
    end
 end

 def show
    @school = School.find_by(id: params[:id])
 end

 def destroy
   @school = School.find(params[:id]) 
  if @current_user.id == @school.user_id
   @school.destroy
   redirect_to schools_path
  else
   flash[:message] = "Sorry, you did not create this"
   redirect_to '/schools'
  end
 end


 private

  def school_params
   params.require(:school).permit(:name, :city, :state, :user_id)
  end
end

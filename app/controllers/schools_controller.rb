class SchoolsController < ApplicationController

    before_action :redirect_if_not_signed_in

 def new
 @school = School.new
 end

 def index
  @schools = School.all 
 end

 def create
    @school = School.create(school_params)
    if school.save   
    redirect_to schools_path(@school)
    else
    render :new
    end
 end

 def show
    @school = School.find_by(id: params[:id])
 end

 private

  def school_params
   params.require(:school).permit(:name, :city, :state)
  end
end

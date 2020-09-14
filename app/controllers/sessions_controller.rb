class SessionsController < ApplicationController

  def home
  end

  def create
   user = User.find_by(username: params[:user][:username])
   if user && user.authentication(params[:user][:username])
       session[:user_id] = @user.id
       redirect_to user_path(user)
   else
       flash[:message] = "Wrong login, try agan"
       redirect_to login_path
    end    
  end

  def google
   @user = User.find_or_create_by(email: auth['info']['email']) do |user|
   user.username= auth['info']['first_name']
   user.password= SecureRandom.hex(16)
   end  
   if @user.save
     session[:user_id] = @user.id
     redirect_to user_path(@user)
   else
       redirect_to '/'
   end
  end
    
  def destroy
   session.delete :user_id
   @user = nil
   redirect_to root_path
  end
     
  
  def new
  end
   
  private
  
  def auth
   request.env['omniauth.auth']
  end
end

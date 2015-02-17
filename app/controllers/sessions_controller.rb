#sessionscontroller is a convention
#bcrypt does not require on it being called sessionscontroller
class SessionsController < ApplicationController

  def new
  end


  def create
    @user = User.find_by_email(params[:email])
    if @user and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully logged in #{@user.email}!"
    else
      flash.now[:message] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    @user = User.find(session[:user_id])
    redirect_to root_path, notice: "Successfully logged out #{@user.email}!"
  end

end

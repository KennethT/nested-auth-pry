class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        # this is shorthand for:
        # flash.now[:notice] = "Successfully created user!"
        # redirect_to root_path
        # note that this only works for notice
        redirect_to root_path, notice: 'Successfully created user'
      else
        flash.now[:alert] = "Error"
        render :new
      end
  end

private
  def user_params
      params.require(:user).permit(:email, :password)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # current_user is only convention, bcrypt does not require this
  def current_user
    #this is the same as
    # @current_user = @current_user || User.find_by(id :session[:user_id])
    # This will return @current_user if it's already defined, otherwise
    # will try to find the user stored in the session, assign it
    # @current_user, and return the value
    # if session[:user_id] is nil (meaning that th user is not logged in),
    # .find_by will return nil, which will be assigned assigned to @current_user,
    # and returned by the function
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # the code below is a long form description
  # of @current_user ||= User.find_by(id: session[:user_id])
  # long form description:
  # if not @current_user
  #   @current_user = User.find_by(id: session[:user_id])
  # else
  #   @current_user
  # end


  # this will be called before every action
  # that we want logged in users to be able
  # to access
  def authenticate
    if not current_user
      redirect_to signin_path, notice: 'Not logged in'
    end
  end


  #allows us to call current_user
  #in any view that inherits from
  #ApplicationController
  helper_method :current_user



end

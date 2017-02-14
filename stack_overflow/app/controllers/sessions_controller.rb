class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] =  "yay"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] =  "boo"
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "bye"
    redirect_to '/'
  end
end

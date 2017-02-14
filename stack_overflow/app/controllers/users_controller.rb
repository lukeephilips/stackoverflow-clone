class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="Welcome to the site!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert]= @user.errors.full_messages.each {|m| m.to_s}.join(" | ")
      redirect_to :back
    end
  end

private
def user_params
  params.require(:user).permit(:email, :password, :password_confirmation)
end
end

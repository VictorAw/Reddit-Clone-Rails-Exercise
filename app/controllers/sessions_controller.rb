class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:session][:username], params[:session][:password])
    login(@user)
    redirect_to user_url(@user)
  end

  def destroy
    logout!
    redirect_to :back
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end

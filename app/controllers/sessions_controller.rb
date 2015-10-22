class SessionsController < ApplicationController

  def new
    @user = User.new
    render :sign_in
  end

  def create

    @user = User.find_by_creds(params[:user][:user_email], params[:user][:password])
    unless @user.nil?
      login(@user)

      # render text: login successful
    else
      flash.now[:errors] = ["Incorrect login credentials!"]
      @user= User.new(params.require(:user).permit(:user_email))
      render :sign_in
    end

  end

  def destroy
    current_user.reset_session!
    session[:session_token] = nil
    redirect_to new_session_url

  end




end

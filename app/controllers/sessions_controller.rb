class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # params[:user][:email], params[:user][:password]
    @user = User.find_by_email(params[:user][:email])

    if @user.nil?
      flash.now[:error] = 'No such user exists.'
      @user = User.new(params[:user])
      render :new
      
      # REV: could refactor since the else and if @user.nil? are the same
      # REV: maybe change to 'if !user.nil && password = user password', else
    elsif @user.password == params[:user][:password]
      session[:user_id] = @user.id
      session[:cart] = {}.to_json
      #redirect_to @user
      redirect_to user_url(@user)
    else #password doesn't match given user object
      flash.now[:error] = 'Invalid email/password combination'
      @user = User.new(params[:user])
      render :new
    end
  end

  def destroy
    # REV: Think it would be better to just delete the entire session upon logout
    session.delete(:user_id)
    redirect_to new_session_url #redirect to sign_in?
  end
end

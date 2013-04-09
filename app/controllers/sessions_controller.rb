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
    session.delete(:user_id)
    redirect_to new_session_url #redirect to sign_in?
  end
end

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
      redirect_to @user
    else #password doesn't match given user object
      flash.now[:error] = 'Invalid email/password combination'
      @user = User.new(params[:user])
      render :new
    end

  end

  def destroy
    session[:user_id] = nil

    redirect_to users_url
  end
end

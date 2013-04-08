class UsersController < ApplicationController

  def show
    if session[:user_id] != params[:id].to_i
      redirect_to new_session_url
    else
      @user = User.find(params[:id])
    end
  end

  def new
  end
end

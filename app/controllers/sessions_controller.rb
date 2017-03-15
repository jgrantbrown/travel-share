class SessionsController < ApplicationController
#  before_action :require_login
#  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end



end

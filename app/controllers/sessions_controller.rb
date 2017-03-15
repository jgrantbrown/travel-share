class SessionsController < ApplicationController
#  before_action :require_login
#  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.nil?
      redirect_to login_path
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end

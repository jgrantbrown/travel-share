class SessionsController < ApplicationController
#  before_action :require_login
#  skip_before_action :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
    @users = User.all
  end

  def create
  #  byebug
    @user = User.find_by(username: params[:user][:username])
    #byebug
    if @user #&& @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to login_path
    end
  end

  def destroy
    session.delete :username
    redirect_to '/login'
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end

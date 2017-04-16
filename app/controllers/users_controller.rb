class UsersController < ApplicationController
  #before_action :require_login
  #skip_before_action :require_login, only: [:new, :create]

  def index
    @users = User.all
    @user= User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @cities = City.all
  end

  def update
    @user = User.find(params[:id])
    @user.first_name = user_params[:first_name]
    @user.last_name = user_params[:last_name]
    @user.bio = user_params[:bio]
    @user.save
    #@user.update(user_params)
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips.all
  end

  def destroy
    session.delete :user_id
    redirect_to '/login'
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name,:last_name, :email, :bio, :admin, :password, :password_confirmation)
    end


end

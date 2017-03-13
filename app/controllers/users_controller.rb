class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  # def login_page
  # end
  #
  # def login
  #   byebug
  #   @user = User.find_by(username: params[:username])
  #   redirect_to user_path(@user.id)
  # end

  def edit
    @user = User.find(params[:id])
    @cities = City.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @trips = []
    params[:status].each do |city_id, status|
      binding.pry
      @trips << Trip.find_or_create_by(user_id: params[:id], city_id: city_id)
    end
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    @trips = @user.trips.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name,:last_name, :email, :bio, :admin)
  end

end

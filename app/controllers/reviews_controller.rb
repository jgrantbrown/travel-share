class ReviewsController < ApplicationController

  def index
  end

  def new
    @review = Review.new
    @user = User.find(session[:user_id])
    @city = @user.trips.find_by(id: params[:trip_id]).city
    session[:trip_id] = params[:trip_id]
  end

  def create
    @review = Review.create(review_params)
    @review.trip_id = session[:trip_id]
    @user = User.find(session[:user_id])
    #binding.pry
    redirect_to city_path(@city)
  end

  def show
    @review = Review.find(params[:id])
    @reviews = @user.trips.all
  end

  private
    def review_params
      params.require(:review).permit(:trip_id, :description, :rating)
    end
 end

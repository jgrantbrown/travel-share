class ReviewsController < ApplicationController
  def index
  end
  def new
    @review = Review.new
  end
  def create
    # @review = Review.new(review_params)
    # if @review.save
    #   session[:user_id] = @user.id
    #   redirect_to city_path(@review)
    # else
    #   redirect_to city_path
    # end
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

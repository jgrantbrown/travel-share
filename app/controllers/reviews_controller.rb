class ReviewsController < ApplicationController

  def index
    if params[:trip_id]
      @reviews = Trip.find(params[:trip_id]).review
    else
      @reviews = Review.all
    end
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      # session[:user_id] = @user.id
      redirect_to city_path
    else
      render :show
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private
      def review_params
        params.require(:review).permit(:trip_id, :description, :rating)
      end

end

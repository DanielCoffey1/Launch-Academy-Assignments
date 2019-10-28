class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      flash[:notice] = "Review added successfully!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Review could not be added!"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end

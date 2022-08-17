class ReviewsController < ApplicationController
  def index
    @reviews = Review.where(restaurant_id: params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def new
    #@review = Review.new
    #@restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

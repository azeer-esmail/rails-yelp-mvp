class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # def show
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'review was successfully created.'
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  #   if @review.update(review_params)
  #     redirect_to @review, notice: "review was successfuly updated."
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), notice: "review was successfuly deleted."
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

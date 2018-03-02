class ReviewsController < ApplicationController

  before_filter :authorize

  def create
      @current_user = User.find(session[:user_id])
      @review = Review.new(review_params)
      @review.product_id = params[:product_id]
      @review.user_id = @current_user.id
    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @review.product
  end


  private

  def review_params
    params.require(:review).permit(:description, :rating, :product_id, :user_id)
  end

end

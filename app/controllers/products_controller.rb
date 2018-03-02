class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @newreview = Review.new
    @reviews = Review.where(product_id: params[:id])
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @reviews
      @average_rating = Review.where(product_id: params[:id]).average(:rating).round(2)
    end
  end

end

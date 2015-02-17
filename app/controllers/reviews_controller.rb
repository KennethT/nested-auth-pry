class ReviewsController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  def index
    @reviews = Review.all
  end

  def show
    @location = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @company = Company.find(params[:company_id])
    @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]

    if @review.save
      redirect_to [@review.product.company, @review.product]
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end

end

class ProductsController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Products.all
  end

  def new
    @product = Product.new
    @company = Company.find(params[:company_id])
  end

  def create
    @product = Product.new(product_params)
    @product.company_id = params[:company_id]
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end


private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:department, :name, :price)
  end
end

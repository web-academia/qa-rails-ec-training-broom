class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(2)
    @product_all = Product.all
    @categories = Category.pluck("category_name")
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
